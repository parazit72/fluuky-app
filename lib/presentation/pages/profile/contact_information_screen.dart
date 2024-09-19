import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/mobile_input_widget.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class ContactInformationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();

  ContactInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('contactInformation')),
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
                      MobileInputWidget(
                        controller: _authController.mobileController,
                        labelText: '',
                        hintText: t.translate('enterPhoneNumber'),
                      ),
                      const SizedBox(height: 20),
                      InputTextFieldWidget(
                          controller: _authController.emailController, labelText: t.translate('email'), hintText: t.translate('enterEmailAddress')),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(color: Color(0xFFDBDBDB)),
                            BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                          ],
                          color: Theme.of(context).primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_outline_rounded, color: Theme.of(context).primaryColor),
                            const SizedBox(width: 8), // Add space between the icon and text
                            Expanded(
                              // Wrap text with Expanded to avoid overflow
                              child: Text(
                                t.translate('thisInfoCanOnlyCS@FLUUKY.com'),
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ],
                        ),
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
                      SnackBar(content: Text(t.translate('processing_data'))),
                    );
                    Get.toNamed(helpCenter);

                    // _authController.registerWithEmail();
                  }
                },
                child: Text(t.translate('goToHelpCenter')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
