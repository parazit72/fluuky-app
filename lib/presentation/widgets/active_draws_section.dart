import 'package:flutter/material.dart';

class ActiveDrawsSection extends StatelessWidget {
  const ActiveDrawsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Active Draws', style: Theme.of(context).textTheme.headlineSmall),
        Container(
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
    );
  }
}
