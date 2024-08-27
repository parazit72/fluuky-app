import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class ProfilePreferencesScreen extends StatelessWidget {
  ProfilePreferencesScreen({super.key});
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarSingleWidget(title: 'Profile'),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: ListView(
          children: [
            const SizedBox(height: 32),
            buildSectionTitle('Account', context),
            buildPreferenceItem('Personal Data', personalData),
            buildPreferenceItem('Contact Information', contactInformation),
            buildPreferenceItem('Change Password', changePassword),
            const SizedBox(height: 32),
            buildSectionTitle('Checkout Details', context),
            buildPreferenceItem('Billing Address', billingAddress),
            buildPreferenceItem('Shipping Address', shippingAddress),
            buildPreferenceItem('Payment Method', paymentMethod),
            const SizedBox(height: 32),
            buildSectionTitle('Manage Subscription', context),
            buildSimpleRow('Membership', 'Basic'),
            buildTextButton('Upgrade now', () {}),
            const SizedBox(height: 32),
            buildSectionTitle('Referral Program', context),
            buildTextButton('Invite a Friend', () {}),
            const SizedBox(height: 32),
            buildSectionTitle('About', context),
            buildPreferenceItem('Privacy Policy', privacyPolicy),
            buildPreferenceItem('Terms of Service', termsAndCondition),
            buildPreferenceItem('Help Center', helpCenter),
            const SizedBox(height: 32),
            buildTextButton('Log out', () {
              _showLogOutSheet();
            }),
            buildTextButton('Delete Account', () {}, color: const Color(0XFFD30201)),
            const SizedBox(height: 32),
            buildSectionTitle('Fluuky in Social Media', context),
            buildSocialMediaRow(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildPreferenceItem(String title, String route) {
    return Column(
      children: [
        InkWell(
          onTap: () => Get.toNamed(route),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), const Icon(Icons.chevron_right)],
          ),
        ),
        const Divider(height: 32),
      ],
    );
  }

  Widget buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
    );
  }

  Widget buildSimpleRow(String title, String value) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title), Text(value, style: TextStyle(color: FluukyTheme.thirdColor))]),
        const Divider(),
      ],
    );
  }

  Widget buildTextButton(String title, VoidCallback onPressed, {Color? color}) {
    return Column(
      children: [
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft,
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(const Size(0, 0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color ?? FluukyTheme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 32),
      ],
    );
  }

  Widget buildSocialMediaRow() {
    const socialMediaIcons = ['email.png', 'whatsapp.png', 'telegram.png', 'facebook.png', 'instagram.png', 'x.png'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: socialMediaIcons.map((icon) => IconButton(onPressed: () {}, icon: Image.asset('assets/images/$icon', width: 32))).toList(),
    );
  }

  void _showLogOutSheet() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.35,
          minChildSize: 0.35,
          maxChildSize: 0.35,
          builder: (context, scrollController) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text('Log out?', style: Theme.of(context).textTheme.titleMedium),
                    Text('Are you sure you want to log out?', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          _authController.logout();
                          Navigator.pop(context);
                          Get.offAllNamed(login);
                        },
                        child: const Text('Log Out')),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
