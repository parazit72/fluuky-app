import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/home_controller.dart';
import 'package:fluuky/presentation/widgets/faq_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  void _showEmailOptions(BuildContext context, String email) {
    var t = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(t.translate('Send an Email')),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: Text(t.translate('Copy Email Address')),
              onTap: () {
                Clipboard.setData(ClipboardData(text: email));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(t.translate('email_address_copied'))),
                );
              },
            ),
          ],
        );
      },
    );
  }

  final HomeController homeController = Get.find();

  Future<void> _refreshFAQs() async {
    homeController.fetchHomeData(); // Assuming this method fetches FAQs again
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('helpCenter')),
      body: RefreshIndicator(
        onRefresh: _refreshFAQs, // Call the refresh method
        child: ListView(
          children: <Widget>[
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.translate('Frequently Asked Questions'),
                    style: FluukyTheme.lightTheme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    t.translate('faqDescription'),
                    style: FluukyTheme.lightTheme.textTheme.bodySmall,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            Obx(
              () {
                if (homeController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (homeController.faqs.isEmpty) {
                  return Container();
                }

                // Constrain ListView.builder inside Expanded
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // Prevents ListView from scrolling independently
                  itemCount: homeController.faqs.length,
                  itemBuilder: (context, index) {
                    final bool belowItemExpanded = (index < homeController.faqs.length - 1) ? homeController.faqs[index + 1].isExpanded : false;
                    final faq = homeController.faqs[index];
                    return CustomFAQTile(
                      item: faq,
                      onTap: () {
                        for (var otherItem in homeController.faqs) {
                          if (otherItem != faq) {
                            otherItem.isExpanded = false;
                          }
                        }
                        faq.isExpanded = !faq.isExpanded;
                        homeController.faqs.refresh(); // Refresh to update UI
                      },
                      isLastItem: index == homeController.faqs.length - 1,
                      belowItemExpanded: belowItemExpanded,
                    );
                  },
                );
              },
            ),
            InkWell(
              onTap: () {
                sendEmailSheet();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.translate('contactUs'),
                      style: FluukyTheme.lightTheme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      t.translate('stillHaveQuestions'),
                      style: FluukyTheme.lightTheme.textTheme.bodySmall,
                    ),
                    ContactItem(
                      icon: 'assets/images/email.png',
                      label: homeController.info.value.email,
                    ),
                    const ContactItem(
                      icon: 'assets/images/whatsapp.png',
                      label: 'WhatsApp Us',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendEmailSheet() {
    var t = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.25,
          minChildSize: 0.25,
          maxChildSize: 0.25,
          builder: (context, scrollController) {
            return Container(
              width: MediaQuery.of(context).size.width,
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 20.h),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      ),
                      onPressed: () {
                        launchUrl(Uri(scheme: 'mailto', path: 'example@example.com'));
                        Navigator.pop(context);
                      },
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(Icons.email, color: Colors.black),
                          SizedBox(width: 8.w),
                          Text(t.translate('Send an Email'), style: const TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      ),
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(text: 'cs@fluuky.com'));
                        Navigator.pop(context);
                      },
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(Icons.copy, color: Colors.black),
                          SizedBox(width: 8.w),
                          Text(t.translate('copy_the_email'), style: const TextStyle(color: Colors.black)),
                        ],
                      ),
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

class ContactItem extends StatelessWidget {
  final String icon;
  final String label;

  const ContactItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(icon, width: 32),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
