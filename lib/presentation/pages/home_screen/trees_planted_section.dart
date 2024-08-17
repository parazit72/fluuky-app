import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TreesPlantedSection extends StatelessWidget {
  const TreesPlantedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text('0 Trees Planted', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(color: Color(0xFFDBDBDB)),
                BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
              borderRadius: BorderRadius.circular(8),
              // image: const DecorationImage(image: AssetImage('assets/images/paper.jpg'), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/tree-green.svg',
                    colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn), width: 50, height: 50),
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
          ),
        ],
      ),
    );
  }
}
