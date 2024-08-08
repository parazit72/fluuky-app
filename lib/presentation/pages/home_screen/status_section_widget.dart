import 'package:flutter/material.dart';
import 'package:fluuky/presentation/pages/profile/dashboard_screen/user_status_section.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x00000014)),
          BoxShadow(color: Colors.white, spreadRadius: 4.0, blurRadius: 8.6),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Status', style: Theme.of(context).textTheme.headlineSmall),
          const Divider(),
          const UserStatusWidget(),
        ],
      ),
    );
  }
}
