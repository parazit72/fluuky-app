import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class BillingAddressScreen extends StatelessWidget {
  BillingAddressScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('billingAddress')),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Stack(
          children: [
            ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      InputTextFieldWidget(
                          controller: _authController.firstNameController, labelText: t.translate('fullName'), hintText: t.translate('fullName')),
                      const SizedBox(height: 20),
                      InputTextFieldWidget(
                          controller: _authController.firstNameController,
                          labelText: t.translate('addressLine1'),
                          hintText: t.translate('addressLine1')),
                      const SizedBox(height: 20),
                      InputTextFieldWidget(
                          controller: _authController.firstNameController,
                          labelText: t.translate('addressLine2'),
                          hintText: t.translate('addressLine2')),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: InputTextFieldWidget(
                                  controller: _authController.firstNameController,
                                  labelText: t.translate('state_region'),
                                  hintText: t.translate('state_region'))),
                          const SizedBox(width: 15),
                          Expanded(
                            child: InputTextFieldWidget(
                                controller: _authController.firstNameController,
                                labelText: t.translate('zipPostalCode'),
                                hintText: t.translate('zipPostalCode')),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(t.translate('billing_equals_shipping'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                          Obx(
                            () {
                              return Switch(
                                value: _authController.isBillingAddressEqualShippingAddress.value,
                                onChanged: (value) {
                                  _authController.isBillingAddressEqualShippingAddress(value);
                                },
                              );
                            },
                          )
                        ],
                      )
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
                      SnackBar(content: Text(t.translate('processing_data'))),
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
