import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:get/get.dart';

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 27),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo-green.png', height: 24),
              Text('Fluuky Green Subscription', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'With a Green Subscription, you not only contribute to planting trees, but you also get a chance to win.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {
              Get.toNamed(greenSubscription);
            },
            child: const Text('Learn More'),
          ),
        ],
      ),
    );
  }
}
