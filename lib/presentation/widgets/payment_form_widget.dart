import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/payment_form_controller.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class PaymentFormWidget extends StatelessWidget {
  // Initialize the controller
  final PaymentFormController controller = Get.put(PaymentFormController());

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!; // Assuming you are using AppLocalizations for translations

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(t.translate('payment_info'), style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCardIcon(context, 'assets/credit-cards/mastercard.png'),
              _buildCardIcon(context, 'assets/credit-cards/mastercard.png'),
              _buildCardIcon(context, 'assets/credit-cards/mastercard.png'),
            ],
          ),
          const SizedBox(height: 20),
          InputTextFieldWidget(
            controller: controller.nameController,
            labelText: t.translate('nameOnCard'),
            hintText: t.translate('nameOnCard'),
            validator: (value) => value?.isEmpty ?? true ? 'Name is required' : null,
          ),
          const SizedBox(height: 20),
          InputTextFieldWidget(
            controller: controller.cardNumberController,
            labelText: t.translate('card_number'),
            hintText: t.translate('card_number'),
            validator: (value) => value?.isEmpty ?? true ? 'Card number is required' : null,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InputTextFieldWidget(
                  controller: controller.expirationDateController,
                  labelText: t.translate('expirationDate'),
                  hintText: t.translate('expirationDate'),
                  validator: (value) => value?.isEmpty ?? true ? 'Expiration date is required' : null,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: InputTextFieldWidget(
                  controller: controller.cvvController,
                  labelText: t.translate('CVV'),
                  hintText: t.translate('CVV'),
                  validator: (value) => value?.isEmpty ?? true ? 'CVV is required' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: controller.submitForm,
            child: Text(t.translate('Continue')),
          ),
        ],
      ),
    );
  }

  // Helper method to build card icon containers
  Widget _buildCardIcon(BuildContext context, String assetPath) {
    return Container(
      width: (MediaQuery.of(context).size.width - 90) / 3,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: const Color(0xFFDBDBDB)),
      ),
      child: Center(child: Image.asset(assetPath, height: 32)),
    );
  }
}
