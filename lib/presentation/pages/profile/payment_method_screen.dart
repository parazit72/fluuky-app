import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
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
    return BackgroundScaffold(
      appBar: const AppBarSingleWidget(title: 'Payment Method'),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Stack(
          children: [
            ListView(
              children: [
                Form(
                    key: _formKey,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Payment Information', style: Theme.of(context).textTheme.titleMedium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: (MediaQuery.of(context).size.width - 90) / 3,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: const Color(0xFFDBDBDB)),
                              ),
                              child: Center(child: Image.asset('assets/credit-cards/mastercard.png', height: 32))),
                          Container(
                              width: (MediaQuery.of(context).size.width - 90) / 3,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: const Color(0xFFDBDBDB)),
                              ),
                              child: Center(child: Image.asset('assets/credit-cards/mastercard.png', height: 32))),
                          Container(
                              width: (MediaQuery.of(context).size.width - 90) / 3,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: const Color(0xFFDBDBDB)),
                              ),
                              child: Center(child: Image.asset('assets/credit-cards/mastercard.png', height: 32))),
                        ],
                      ),
                      const SizedBox(height: 20),
                      InputTextFieldWidget(controller: _authController.firstNameController, labelText: 'Name On Card', hintText: 'Name On Card'),
                      const SizedBox(height: 20),
                      InputTextFieldWidget(controller: _authController.firstNameController, labelText: 'Card Number', hintText: 'Card Number'),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: InputTextFieldWidget(
                                  controller: _authController.firstNameController, labelText: 'Expiration Date', hintText: 'Expiration Date')),
                          const SizedBox(width: 15),
                          Expanded(
                            child: InputTextFieldWidget(controller: _authController.firstNameController, labelText: 'CVV', hintText: 'CVV'),
                          ),
                        ],
                      ),
                    ]))
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
