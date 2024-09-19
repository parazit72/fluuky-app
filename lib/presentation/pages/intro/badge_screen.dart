import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class BadgeScreen extends StatelessWidget {
  final List<Map<String, String>> textParts = [
    {'heading': '1. Introduction', 'content': 'This is the introduction part of the text. It provides an overview of the topic.'},
    {'heading': '2. Main Content', 'content': 'This is the main content part of the text. It provides detailed information on the topic.'},
    {'heading': '3. Conclusion', 'content': 'This is the conclusion part of the text. It summarizes the topic and provides final thoughts.'},
  ];

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            t.translate('terms_conditions'),
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/long-background.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          ListView.builder(
            itemCount: textParts.length,
            itemBuilder: (context, index) {
              final part = textParts[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${part['heading']}\n',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: part['content'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
