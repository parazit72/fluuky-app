import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
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
  final List<Item> _data = generateItems(5);

  void _showEmailOptions(BuildContext context, String email) {
    var t = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(t.translate('send_an_email')),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: Text(t.translate('copy_email_address')),
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

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('helpCenter')),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.translate('faq'),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8.0),
                Text(
                  t.translate('faqDescription'),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          ..._data.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;

            // Check if the next item is expanded
            final bool belowItemExpanded = (index < _data.length - 1) ? _data[index + 1].isExpanded : false;

            return CustomFAQTile(
              item: item,
              onTap: () {
                setState(() {
                  // Collapse all other items
                  for (var otherItem in _data) {
                    if (otherItem != item) {
                      otherItem.isExpanded = false;
                    }
                  }
                  // Toggle the selected item
                  item.isExpanded = !item.isExpanded;
                });
              },
              isLastItem: index == _data.length - 1,
              belowItemExpanded: belowItemExpanded, // Pass the below item expanded state
            );
          }),
          InkWell(
            onTap: () {
              sendEmailSheet();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.translate('contactUs'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    t.translate('stillHaveQuestions'),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor),
                  ),
                  const ContactItem(
                    icon: 'assets/images/email.png',
                    label: 'cs@fluuky.com',
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 20),
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
                          const SizedBox(width: 8),
                          Text(t.translate('send_an_email'), style: const TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
                          const SizedBox(width: 8),
                          Text(t.translate('copy_the_email'), style: const TextStyle(color: Colors.black)),
                        ],
                      ),
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

class CustomFAQTile extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;
  final bool isLastItem;
  final bool belowItemExpanded; // Add this field

  const CustomFAQTile({
    super.key,
    required this.item,
    required this.onTap,
    required this.isLastItem,
    required this.belowItemExpanded, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: item.isExpanded ? 16.0 : 0),
      decoration: item.isExpanded
          ? const BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black45),
                BoxShadow(color: Color(0XAAF7F7F7), spreadRadius: -4.0, blurRadius: 8.6),
              ],
              color: Color(0XAAF7F7F7),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title:
                Text(item.headerValue, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: item.isExpanded ? Colors.black : Colors.grey)),
            trailing: Icon(item.isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: onTap,
          ),
          if (item.isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: item.expandedValue.map((point) {
                  return Text(point, style: const TextStyle(fontSize: 16));
                }).toList(),
              ),
            ),
          // Show Divider only when item is not expanded, it's not the last item, and below item is not expanded
          if (!item.isExpanded && !isLastItem && !belowItemExpanded) const Divider(),
        ],
      ),
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

class Item {
  Item({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });

  String headerValue;
  List<String> expandedValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'How do I subscribe?',
      expandedValue: [
        '• Log in to your Fluuky account.',
        '• Navigate to the "Fluuky Green Subscription" section.',
        '• Calculate your carbon footprint and discover your compensation needs.',
        '• Set up your payment method for automatic billing.',
        '• Confirm your subscription.',
      ],
    );
  });
}
