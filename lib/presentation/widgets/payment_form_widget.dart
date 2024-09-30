import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/payment_form_controller.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class PaymentFormWidget extends StatelessWidget {
  final PaymentFormController controller = Get.put(PaymentFormController());

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Text(t.translate('payment_info'), style: FluukyTheme.lightTheme.textTheme.labelMedium),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCardIcon(context, 'assets/credit-cards/mastercard.png'),
              _buildCardIcon(context, 'assets/credit-cards/mastercard.png'),
              _buildCardIcon(context, 'assets/credit-cards/mastercard.png'),
            ],
          ),
          SizedBox(height: 20.h),
          InputTextFieldWidget(
            controller: controller.nameController,
            labelText: t.translate('Name On Card'),
            hintText: t.translate('Name On Card'),
            validator: (value) => value?.isEmpty ?? true ? t.translate('Name is required') : null,
          ),
          SizedBox(height: 20.h),
          InputTextFieldWidget(
            controller: controller.cardNumberController,
            labelText: t.translate('card_number'),
            hintText: t.translate('card_number'),
            validator: (value) => value?.isEmpty ?? true ? t.translate('Card number is required') : null,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InputTextFieldWidget(
                  controller: controller.expirationDateController,
                  labelText: t.translate('expirationDate'),
                  hintText: t.translate('expirationDate'),
                  validator: (value) => value?.isEmpty ?? true ? t.translate('Expiration date is required') : null,
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: InputTextFieldWidget(
                  controller: controller.cvvController,
                  labelText: t.translate('CVV'),
                  hintText: t.translate('CVV'),
                  validator: (value) => value?.isEmpty ?? true ? t.translate('CVV is required') : null,
                ),
              ),
            ],
          ),
          // SizedBox(height: 20.h),
          // ElevatedButton(
          //   onPressed: controller.submitForm,
          //   child: Text(t.translate('Continue')),
          // ),
        ],
      ),
    );
  }

  // Helper method to build card icon containers
  Widget _buildCardIcon(BuildContext context, String assetPath) {
    return Container(
      width: 95.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(width: 1, color: FluukyTheme.secondaryColor),
      ),
      child: Center(child: Image.asset(assetPath, height: 32.h)),
    );
  }
}
