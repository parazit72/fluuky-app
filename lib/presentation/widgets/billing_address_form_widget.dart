import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/country_picker_sheet_widget.dart';
import 'package:fluuky/presentation/widgets/input_text_field_widget.dart';
import 'package:fluuky/presentation/widgets/mobile_input_widget.dart';
import 'package:get/get.dart';

class BillingAddressFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AuthController _authController = Get.find<AuthController>();

  BillingAddressFormWidget({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            InputTextFieldWidget(
              controller: _authController.firstNameController,
              labelText: t.translate('fullName'),
              hintText: t.translate('fullName'),
            ),
            SizedBox(height: 20.h),
            MobileInputWidget(
              labelText: 'Country',
              hintText: '',
              controller: _authController.mobileController,
              showCode: false,
            ),
            // Row(
            //   children: [
            //     SizedBox(width: 80.w, child: ),
            //     SizedBox(
            //       width: 247.w,
            //       child: InputTextFieldWidget(
            //         controller: _authController.firstNameController,
            //         labelText: t.translate('City'),
            //         hintText: t.translate('Select'),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 20.h),
            InputTextFieldWidget(
              controller: _authController.firstNameController,
              labelText: t.translate('addressLine1'),
              hintText: t.translate('addressLine1'),
            ),
            SizedBox(height: 20.h),
            InputTextFieldWidget(
              controller: _authController.firstNameController,
              labelText: t.translate('addressLine2'),
              hintText: t.translate('addressLine2'),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: InputTextFieldWidget(
                        controller: _authController.firstNameController,
                        labelText: t.translate('state_region'),
                        hintText: t.translate('state_region'))),
                SizedBox(width: 15.w),
                Expanded(
                  child: InputTextFieldWidget(
                      controller: _authController.firstNameController,
                      labelText: t.translate('zipPostalCode'),
                      hintText: t.translate('zipPostalCode')),
                ),
              ],
            ),
            // SizedBox(height: 20.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(t.translate('billing_equals_shipping'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
            //     Obx(
            //       () {
            //         return Switch(
            //           value: _authController.isBillingAddressEqualShippingAddress.value,
            //           onChanged: (value) {
            //             _authController.isBillingAddressEqualShippingAddress(value);
            //           },
            //         );
            //       },
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
