import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class BundleSection extends StatelessWidget {
  final String title;
  final String description;
  final String ticketsInfo;
  final String discountInfo;

  const BundleSection({
    required this.title,
    required this.description,
    required this.ticketsInfo,
    required this.discountInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(title, style: FluukyTheme.lightTheme.textTheme.titleLarge),
          const SizedBox(height: 16),
          Text(description, style: FluukyTheme.lightTheme.textTheme.displaySmall),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Theme.of(context).primaryColor),
                child: const Icon(Icons.airplane_ticket, size: 32, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(ticketsInfo, style: FluukyTheme.lightTheme.textTheme.displaySmall),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Theme.of(context).primaryColor),
                child: const Icon(Icons.discount, size: 32, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(discountInfo, style: FluukyTheme.lightTheme.textTheme.displaySmall)),
            ],
          ),
        ],
      ),
    );
  }
}
