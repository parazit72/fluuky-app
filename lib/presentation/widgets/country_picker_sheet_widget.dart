import 'package:flutter/material.dart';

class CountryPickerSheetWidget extends StatelessWidget {
  final Function(String, String) onSelect;

  const CountryPickerSheetWidget({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final countries = [
      {'name': 'United Arab Emirates', 'code': '+971', 'flag': 'ae'},
      {'name': 'United States', 'code': '+1', 'flag': 'us'},
      {'name': 'Canada', 'code': '+1', 'flag': 'ca'},
      {'name': 'United Kingdom', 'code': '+44', 'flag': 'gb'},
    ];

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return ListTile(
            leading: Image.asset('assets/flags/${country['flag']}.png', width: 24),
            title: Text(country['name']!),
            trailing: Text(country['code']!),
            onTap: () {
              onSelect(country['flag']!, country['code']!);
            },
          );
        },
      ),
    );
  }
}
