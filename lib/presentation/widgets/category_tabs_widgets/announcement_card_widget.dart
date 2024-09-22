import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class AnnouncementCardWidget extends StatelessWidget {
  final AnnouncementEntity announcement;

  const AnnouncementCardWidget({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final locale = Get.locale;

    // Define a method to format numbers based on locale
    String formatNumber(String number) {
      if (locale?.languageCode == 'ar') {
        return Arabic.number(number);
      } else {
        return number;
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Text('Rolex Cosmograph Daytona'), IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right))],
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.3,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFDBDBDB)),
              boxShadow: const [
                BoxShadow(color: Color(0xFFDBDBDB)),
                BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Icon(Icons.play_arrow, size: MediaQuery.of(context).size.height * 0.1, color: const Color(0XFF8C8C8C)))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimerSegment('02', t.translate('days_label')),
              const Text(':', style: TextStyle(fontSize: 20)),
              _buildTimerSegment('02', t.translate('hours_label')),
              const Text(':', style: TextStyle(fontSize: 20)),
              _buildTimerSegment('02', t.translate('minutes_label')),
              const Text(':', style: TextStyle(fontSize: 20)),
              _buildTimerSegment('02', t.translate('seconds_label')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(children: [
                Padding(padding: const EdgeInsets.only(right: 5), child: SvgPicture.asset('assets/images/ticket-active.svg')),
                const SizedBox(width: 10),
                Text(t.translate('ticketsRemaining'))
              ]),
              Text(formatNumber('576/2000'))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(onPressed: () {}, child: Text(t.translate('buyMoreTickets'))),
        ),
        const Divider(height: 24),
      ],
    );
  }
}

Widget _buildTimerSegment(String value, String unit) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(value),
      Text(unit),
    ],
  );
}
