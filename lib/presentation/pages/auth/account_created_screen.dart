import 'package:flutter/material.dart';

class AccountCreatedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            'assets/images/long-background.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Text(
              'Amazing, you’re all set!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Click Let’s Start Planting to plant your first tree and select from our range of luxury draws!',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Image.asset(
              'assets/images/show-background.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ]),
        ),
        Positioned(
          bottom: 20,
          child: ElevatedButton(onPressed: () {}, child: const Text('Let’s Start Planting')),
        ),
      ]),
    );
  }
}
