import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/background_scaffold.dart';

class WeForestInfoScreen extends StatelessWidget {
  const WeForestInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: BackgroundScaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(color: const Color.fromARGB(255, 233, 239, 235), borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset('assets/images/weforest-logo.png', fit: BoxFit.contain, height: 121),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Fluuky proudly partners with WeForest',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Through this partnership, and with your advocacy, we are on a mission to make a tangible and measurable impact on global reforestation programs.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                'VALUES THAT INSPIRE OUR WORK:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16.0),
              const Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text('Passion'),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text('Collaboration'),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text('Integrity'),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text('Transparency'),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text('Excellence'),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const Chip(
                backgroundColor: Colors.white,
                label: Text('Courage'),
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle learn more action
                  },
                  child: const Text('Learn More'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
