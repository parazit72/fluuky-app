import 'package:flutter/material.dart';

class ActiveDrawsSection extends StatelessWidget {
  const ActiveDrawsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Active Draws', style: Theme.of(context).textTheme.titleLarge),
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Color(0xFFDBDBDB)),
                BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
            ),
            child: Column(
              children: [
                Image.asset('assets/images/ticket.png', fit: BoxFit.cover, width: 64),
                const SizedBox(height: 16),
                Text(
                  "You're yet to enter, but there's still time!\nStart planting trees for a chance to win.",
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Enter Now!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
