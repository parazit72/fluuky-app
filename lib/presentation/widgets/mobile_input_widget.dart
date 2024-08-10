import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileInputWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;

  const MobileInputWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.focusNode,
  });

  @override
  _MobileInputWidgetState createState() => _MobileInputWidgetState();
}

class _MobileInputWidgetState extends State<MobileInputWidget> {
  String selectedCountry = 'ae';
  String countryCode = '+971';
  bool validator = false.obs();

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerSheet(
          onSelect: (String country, String code) {
            setState(() {
              selectedCountry = country;
              countryCode = code;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: _showCountryPicker,
              child: Container(
                height: 48,
                width: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(color: Color(0xFFDBDBDB)),
                    BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/flags/$selectedCountry.png', width: 24),
                    const SizedBox(width: 8),
                    Text(countryCode),
                    const Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
              ),
            ),
            SizedBox(height: validator ? 26 : 0),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Stack(children: [
            Container(
                height: 48,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(color: Color(0xFFDBDBDB)),
                    BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                  ],
                )),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  validator = true;
                  setState(() {});
                  return 'Please enter your mobile number';
                }
                validator = false;
                setState(() {});
                return null;
              },
              keyboardType: TextInputType.phone,
              controller: widget.controller,
              focusNode: widget.focusNode,
              decoration: InputDecoration(
                labelText: widget.hintText,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class CountryPickerSheet extends StatelessWidget {
  final Function(String, String) onSelect;

  const CountryPickerSheet({super.key, required this.onSelect});

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
