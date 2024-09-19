import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/country_picker_sheet_widget.dart';
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
        return CountryPickerSheetWidget(
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
    var t = AppLocalizations.of(context)!;

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
                  return t.translate('please_enter_your_mobile_number');
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
