import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';

class AnnouncementCardWidget extends StatelessWidget {
  final AnnouncementEntity announcement;

  const AnnouncementCardWidget({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(announcement.title),
      ),
    );
  }
}
