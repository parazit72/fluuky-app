import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class DrawItemScreen extends StatelessWidget {
  final RaffleEntity selectedRaffle;
  DrawItemScreen({Key? key, required this.selectedRaffle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left, size: 24),
        ),
        leadingWidth: 24,
        elevation: 0,
        backgroundColor: const Color(0x00F7F7F7),
        title: Text(
          'Draw',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
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
                  Text(selectedRaffle.description, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 10),
                  Text(
                    'Draw Date: ${DateFormat('MMMM dd\'th\', yyyy - HH:mm').format(selectedRaffle.deadline)}',
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
