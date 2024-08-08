import 'package:flutter/material.dart';

class YourImpactWidget extends StatelessWidget {
  const YourImpactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Impact', style: Theme.of(context).textTheme.titleLarge),
          Text('With ever ticket purchase, you are making a measurable impact on reforestation.', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/exclamation-mark.png', width: 16, height: 16),
                  const SizedBox(width: 5),
                  Text('More Details', style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
              Text('10 Trees', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(color: Color(0xFFDBDBDB)),
                BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
