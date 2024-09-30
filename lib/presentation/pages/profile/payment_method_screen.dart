import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('payment_method')),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        child: Stack(
          children: [
            ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.translate('payment_info'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 95.w,
                              height: 56.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.w),
                                border: Border.all(width: 1, color: FluukyTheme.secondaryColor),
                              ),
                              child: Center(child: Image.asset('assets/credit-cards/mastercard.png', height: 32.h))),
                          Container(
                              width: 95.w,
                              height: 56.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.w),
                                border: Border.all(width: 1, color: FluukyTheme.secondaryColor),
                              ),
                              child: Center(child: Image.asset('assets/credit-cards/mastercard.png', height: 32.h))),
                          Container(
                              width: 95.w,
                              height: 56.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.w),
                                border: Border.all(width: 1, color: FluukyTheme.secondaryColor),
                              ),
                              child: Center(child: Image.asset('assets/credit-cards/mastercard.png', height: 32.h))),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      InputTextFieldWidget(
                          controller: _authController.firstNameController,
                          labelText: t.translate('Name On Card'),
                          hintText: t.translate('nameOnCard')),
                      SizedBox(height: 20.h),
                      InputTextFieldWidget(
                          controller: _authController.firstNameController,
                          labelText: t.translate('card_number'),
                          hintText: t.translate('card_number')),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: InputTextFieldWidget(
                                  controller: _authController.firstNameController,
                                  labelText: t.translate('expirationDate'),
                                  hintText: t.translate('expirationDate'))),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: InputTextFieldWidget(
                                controller: _authController.firstNameController, labelText: t.translate('CVV'), hintText: t.translate('CVV')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(t.translate('Processing Data'))),
                    );
                    Get.toNamed(helpCenter);

                    // _authController.registerWithEmail();
                  }
                },
                child: Text(t.translate('saveChanges')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
