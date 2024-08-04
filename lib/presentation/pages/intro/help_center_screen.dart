import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final List<Item> _data = generateItems(5);

  void _showEmailOptions(BuildContext context, String email) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Send an Email'),
              onTap: () {
                // Handle send email
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('Copy Email Address'),
              onTap: () {
                Clipboard.setData(ClipboardData(text: email));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email address copied to clipboard')),
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
    return BackgroundScaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Help Center',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // Title and Description
          Text(
            'Frequently Asked Questions',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8.0),
          Text(
            'From how to subscribe to our tree planting process with WeForest, you will find all the answers to our top questions below.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16.0),
          // FAQ Accordion
          Text(
            'Frequently Asked Questions',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _data[index].isExpanded = !isExpanded;
              });
            },
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.headerValue),
                  );
                },
                body: ListTile(
                  title: Text(item.expandedValue),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
          const SizedBox(height: 16.0),
          // Contact Us Section
          Text(
            'Contact Us',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8.0),
          Text(
            'If you need further assistance, please contact us via email or WhatsApp.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('support@example.com'),
            onTap: () => _showEmailOptions(context, 'support@example.com'),
          ),
          ListTile(
            leading: const Icon(Icons.face),
            title: const Text('WhatsApp Us'),
            onTap: () {
              // Handle WhatsApp action
            },
          ),
        ],
      ),
    );
  }
}

// Helper classes for FAQ items
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'FAQ ${index + 1}',
      expandedValue: 'This is the answer to FAQ ${index + 1}.',
    );
  });
}
