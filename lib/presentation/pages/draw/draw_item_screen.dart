import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class DrawItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'Draw',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSectionWidget(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Winning this watch means carrying a piece of horological history, a companion for both the high seas and high stakes. It\'s more than a timepiece; it\'s a sustainable heirloom designed to be handed down from generation to generation.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Draw Date: December 17th, 2023 - 18:00',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  const DrawDetailsWidget(),
                  const SizedBox(height: 20),
                  NumberPicker(
                    minValue: 1,
                    maxValue: 20,
                    initialValue: 10,
                    onChanged: (value) {
                      print('Selected number: $value');
                    },
                  ),
                  const SizedBox(height: 20),
                  const ScrollingImages(
                    imagePaths: [
                      'assets/images/mountain-layer-1.png',
                      'assets/images/sun.png',
                      'assets/images/mountain-layer-2.png',
                      'assets/images/forest-layer-1.png',
                      'assets/images/forest-layer-2.png',
                      'assets/images/forest-layer-3.png',
                    ],
                    speeds: [1.0, 0.8, 0.5, 0.5, 0.5, 0.5],
                  ),
                  const SizedBox(height: 20),
                  ActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
