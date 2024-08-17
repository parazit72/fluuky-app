import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';

class AnnouncementCardWidget extends StatelessWidget {
  final AnnouncementEntity announcement;

  const AnnouncementCardWidget({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
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
              _buildTimerSegment('02', 'DAYS'),
              const Text(':', style: TextStyle(fontSize: 20)),
              _buildTimerSegment('02', 'HOURS'),
              const Text(':', style: TextStyle(fontSize: 20)),
              _buildTimerSegment('02', 'MINUTES'),
              const Text(':', style: TextStyle(fontSize: 20)),
              _buildTimerSegment('02', 'SECONDS'),
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
                const Text('Tickets:')
              ]),
              const Text('576/2000')
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(onPressed: () {}, child: const Text('Buy More Tickets')),
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
