import 'package:flutter/material.dart';

class TreesPlantedSection extends StatelessWidget {
  const TreesPlantedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Row(
            children: [
              Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text('0 Trees Planted', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Icon(Icons.nature, size: 50, color: Theme.of(context).primaryColor),
              const SizedBox(height: 16),
              Text(
                "You haven't planted any trees just yet.\nStart planting and watch your impact grow.",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Plant Now action
                },
                child: const Text('Plant Now!'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
