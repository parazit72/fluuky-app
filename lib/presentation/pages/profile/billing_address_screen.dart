import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class BillingAddressScreen extends StatelessWidget {
  BillingAddressScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarSingleWidget(title: 'Billing Address'),
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
                      InputTextFieldWidget(controller: _authController.firstNameController, labelText: 'Full Name', hintText: 'Full Name'),
                      const SizedBox(height: 20),
                      InputTextFieldWidget(controller: _authController.firstNameController, labelText: 'Address Line 1', hintText: 'Address Line 1'),
                      const SizedBox(height: 20),
                      InputTextFieldWidget(controller: _authController.firstNameController, labelText: 'Address Line 2', hintText: 'Address Line 2'),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: InputTextFieldWidget(
                                  controller: _authController.firstNameController, labelText: 'State/Region', hintText: 'State/Region')),
                          const SizedBox(width: 15),
                          Expanded(
                            child: InputTextFieldWidget(
                                controller: _authController.firstNameController, labelText: 'ZIP/Postal Code', hintText: 'ZIP/Postal Code'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Billing Address = Shipping Address', style: Theme.of(context).textTheme.bodySmall),
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
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Get.toNamed(helpCenter);

                    // _authController.registerWithEmail();
                  }
                },
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
