import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/paper.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text(description, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Icon(Icons.airplane_ticket, size: 32, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(ticketsInfo, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Icon(Icons.discount, size: 32, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(discountInfo, style: Theme.of(context).textTheme.bodySmall)),
            ],
          ),
        ],
      ),
    );
  }
}
