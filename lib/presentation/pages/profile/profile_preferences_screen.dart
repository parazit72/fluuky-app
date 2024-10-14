import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/language_dropdown.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class ProfilePreferencesScreen extends StatelessWidget {
  ProfilePreferencesScreen({super.key});
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('profile')),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
        child: ListView(
          children: [
            SizedBox(height: 32.h),
            buildSectionTitle(t.translate('Account'), context),
            buildPreferenceItem(t.translate('personalData'), personalData),
            buildPreferenceItem(t.translate('Contact Information'), contactInformation),
            buildPreferenceItem(t.translate('change_password'), changePassword),
            SizedBox(height: 32.h),
            buildSectionTitle(t.translate('checkoutDetails'), context),
            buildPreferenceItem(t.translate('billingAddress'), billingAddress),
            // buildPreferenceItem(t.translate('Shipping Address'), shippingAddress),
            buildPreferenceItem(t.translate('payment_method'), paymentMethod),
            SizedBox(height: 32.h),
            buildSectionTitle(t.translate('Manage Subscription'), context),
            buildSimpleRow(t.translate('Membership'), t.translate('basic')),
            buildTextButton(t.translate('upgrade_now'), () {}),
            SizedBox(height: 32.h),
            buildSectionTitle(t.translate('referral_program'), context),
            buildTextButton(t.translate('invite_a_friend'), () {}),
            SizedBox(height: 32.h),
            buildSectionTitle(t.translate('Language'), context),
            LanguageDropdown(hintText: 'Select Language', initialValue: Get.locale?.languageCode),
            SizedBox(height: 32.h),
            buildSectionTitle(t.translate('About'), context),
            buildPreferenceItem(t.translate('privacy_policy'), privacyPolicy),
            buildPreferenceItem(t.translate('terms_of_service'), termsAndCondition),
            buildPreferenceItem(t.translate('helpCenter'), helpCenter),
            SizedBox(height: 32.h),
            buildTextButton(t.translate('logout'), () => _showLogOutSheet(context), color: FluukyTheme.inputTextColor),
            buildTextButton(t.translate('delete_account'), () {}, color: FluukyTheme.redColor),
            SizedBox(height: 32.h),
            buildSectionTitle(t.translate('fluuky_in_social_media'), context),
            buildSocialMediaRow(),
            SizedBox(height: 40.h),
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
            children: [Text(title, style: FluukyTheme.lightTheme.textTheme.labelMedium), Icon(Icons.chevron_right, size: 24.h)],
          ),
        ),
        Divider(height: 32.h),
      ],
    );
  }

  Widget buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Text(title, style: FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: FluukyTheme.thirdColor)),
    );
  }

  Widget buildSimpleRow(String title, String value) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: FluukyTheme.lightTheme.textTheme.labelMedium),
          Text(value, style: FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: FluukyTheme.thirdColor))
        ]),
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
              Text(title, style: TextStyle(color: color ?? FluukyTheme.primaryColor, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Divider(height: 32.h),
      ],
    );
  }

  Widget buildSocialMediaRow() {
    const socialMediaIcons = ['email.png', 'whatsapp.png', 'telegram.png', 'facebook.png', 'instagram.png', 'x.png'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: socialMediaIcons.map((icon) => IconButton(onPressed: () {}, icon: Image.asset('assets/images/$icon', width: 32.w))).toList(),
    );
  }

  void _showLogOutSheet(context) {
    var t = AppLocalizations.of(context)!;
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
              width: 375.w,
              padding: EdgeInsets.all(20.w),
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
                    SizedBox(height: 20.h),
                    Text(t.translate('logout?'), style: FluukyTheme.lightTheme.textTheme.titleMedium),
                    Text(t.translate('are_you_sure_you_want_to_log_out'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                        onPressed: () {
                          _authController.logout();
                          Navigator.pop(context);
                          Get.offAllNamed(login);
                        },
                        child: Text(t.translate('logout'))),
                    SizedBox(height: 20.h),
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(t.translate('Cancel')),
                    ),
                    SizedBox(height: 10.h),
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
