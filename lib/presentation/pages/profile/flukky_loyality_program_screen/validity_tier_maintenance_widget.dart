import 'package:flutter/material.dart';

class ValidityTierMaintenanceWidget extends StatelessWidget {
  const ValidityTierMaintenanceWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/paper-box.png"), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(color: Color(0xFFDBDBDB)),
            BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Validity and Tier Maintenance', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            const Text(
                'Rolling Period: Your tier status is determined by your total spend in any consecutive 12-month period. This is a rolling period, meaning it is continuously calculated from the date of your first qualifying purchase.'),
          ],
        ));
  }
}
