import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:jhijri/_src/_jHijri.dart';

class GreenSubscriberWidget extends StatelessWidget {
  const GreenSubscriberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0xFFE9EFEB)),
          BoxShadow(color: Colors.white, spreadRadius: -20.0, blurRadius: 20),
        ],
        // image: const DecorationImage(image: AssetImage('assets/images/paper.jpg'), fit: BoxFit.cover),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.asset('assets/images/logo-green.png', height: 24),
              const SizedBox(width: 4),
              Text(t.translate('greensubscription'), style: TextStyle(color: FluukyTheme.primaryColor, fontSize: 14, fontWeight: FontWeight.bold))
            ],
          ),
          Text('${t.translate('memberSince')} ${JHijri(fDate: DateTime.now())}', style: const TextStyle(color: Color(0XFF8C8C8C), fontSize: 12)),
        ],
      ),
    );
  }
}
