import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/mobile_input_widget.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class BillingAddressScreen extends GetView<AuthController> {
  BillingAddressScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('billingAddress')),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(height: 32.h),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  InputTextFieldWidget(
                    controller: controller.firstNameController,
                    labelText: t.translate('fullName'),
                    hintText: t.translate('fullName'),
                    validator: (value) => value?.isEmpty ?? true ? t.translate('Name is required') : null,
                  ),
                  SizedBox(height: 20.h),
                  MobileInputWidget(
                    labelText: 'Country',
                    hintText: '',
                    controller: controller.mobileController,
                    showCode: false,
                  ),
                  SizedBox(height: 20.h),
                  InputTextFieldWidget(
                    controller: controller.firstNameController,
                    labelText: t.translate('City'),
                    hintText: t.translate('Select'),
                    validator: (value) => value?.isEmpty ?? true ? t.translate('City is required') : null,
                  ),
                  SizedBox(height: 20.h),
                  InputTextFieldWidget(
                    controller: controller.firstNameController,
                    labelText: t.translate('addressLine1'),
                    hintText: t.translate('addressLine1'),
                    validator: (value) => value?.isEmpty ?? true ? t.translate('Address is required') : null,
                  ),
                  SizedBox(height: 20.h),
                  InputTextFieldWidget(
                    controller: controller.firstNameController,
                    labelText: t.translate('addressLine2'),
                    hintText: t.translate('addressLine2'),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InputTextFieldWidget(
                          controller: controller.firstNameController,
                          labelText: t.translate('state_region'),
                          hintText: t.translate('state_region'),
                          validator: (value) => value?.isEmpty ?? true ? t.translate('State is required') : null,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: InputTextFieldWidget(
                          controller: controller.firstNameController,
                          labelText: t.translate('zipPostalCode'),
                          hintText: t.translate('zipPostalCode'),
                          validator: (value) => value?.isEmpty ?? true ? t.translate('Zip/Postal Code is required') : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    controller.updateUserBillingAddress();
                    Get.toNamed(helpCenter);
                  }
                },
                child: Text(t.translate('Save Changes')),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
