import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/custom_dropdown_button.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class DetailsAboutYouScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  RxBool iAm18YearsOld = false.obs;

  String? _selectedGender;
  String? _selectedYear;
  String? _selectedMonth;
  String? _selectedDay;

  DetailsAboutYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) => Get.offNamed(signUp),
      child: BackgroundScaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(t.translate('register_4_steps'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                  Text(t.translate('step_3_4'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.translate('Details About You'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                  SizedBox(height: 4.h),
                  Text(t.translate('You’re almost there!'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                  SizedBox(height: 24.h),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: FluukyTheme.secondaryColor),
                        BoxShadow(color: FluukyTheme.fourthColor),
                        const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                      ],
                      color: FluukyTheme.secondaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16.w),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, size: 16.w, color: FluukyTheme.primaryColor),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            t.translate('about_you_msg'),
                            style: FluukyTheme.lightTheme.textTheme.labelSmall!.copyWith(color: FluukyTheme.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(t.translate('date_of_birth'), style: FluukyTheme.lightTheme.textTheme.labelMedium),
                  SizedBox(height: 4.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 87.w,
                        child: CustomDropdownButton(
                          itemsKey: 'days_en',
                          onChanged: (value) => _selectedDay = value,
                          hintText: t.translate('day'),
                        ),
                      ),
                      SizedBox(
                        width: 136.w,
                        child: CustomDropdownButton(
                          itemsKey: 'months_en',
                          onChanged: (value) => _selectedMonth = value,
                          hintText: t.translate('month'),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: CustomDropdownButton(
                          itemsKey: 'years',
                          onChanged: (value) => _selectedYear = value,
                          hintText: t.translate('year'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(t.translate('gender'), style: FluukyTheme.lightTheme.textTheme.labelMedium),
                  CustomDropdownButton(
                    itemsKey: 'genders',
                    onChanged: (value) => _selectedGender = value,
                    hintText: t.translate('Select'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Obx(
                          () => Stack(
                            children: [
                              Image.asset('assets/images/checkbox.png', width: 24.w, height: 24.h),
                              SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    fillColor: WidgetStateProperty.all(Colors.transparent),
                                    value: iAm18YearsOld.value,
                                    onChanged: (bool? value) => iAm18YearsOld.value = value!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: () => iAm18YearsOld.value = !iAm18YearsOld.value,
                          child: Text(
                            t.translate('I confirm that I am 18 years of age or older'),
                            style: FluukyTheme.lightTheme.textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tooltip(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.w), color: FluukyTheme.secondaryColor),
                    height: 14.h,
                    key: tooltipkey,
                    preferBelow: true,
                    padding: EdgeInsets.all(15.w),
                    margin: EdgeInsets.only(bottom: 10.w, top: 10.h),
                    textStyle: TextStyle(fontSize: 12.w),
                    triggerMode: TooltipTriggerMode.manual,
                    waitDuration: const Duration(seconds: 1),
                    showDuration: const Duration(seconds: 3),
                    message: t.translate('Please confirm your age.'),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        textStyle: WidgetStateProperty.all(FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: Colors.white)),
                        minimumSize: WidgetStatePropertyAll(Size(335.w, 48.h)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        print(_formKey.currentState!.validate());

                        if (!_formKey.currentState!.validate()) return;

                        // Check if the user has confirmed they are 18 years or older
                        if (!iAm18YearsOld.value) {
                          // Show the tooltip if age is not confirmed
                          tooltipkey.currentState?.ensureTooltipVisible();
                          return;
                        }

                        // _authController.verifyCode();
                        Get.toNamed(createdPassword);
                      },
                      child: Text(t.translate('continue_button')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
