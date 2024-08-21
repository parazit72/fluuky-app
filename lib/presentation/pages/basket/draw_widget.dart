import 'package:flutter/material.dart';

class DrawWidget extends StatelessWidget {
  const DrawWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/draw_image.png'),
          ),
          const SizedBox(height: 8),
          Text('Draw Title', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
