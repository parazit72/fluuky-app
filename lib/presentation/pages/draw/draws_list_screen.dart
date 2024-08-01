import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class DrawsListScreen extends StatelessWidget {
  const DrawsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarFluuky(),
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
                  const DrawDetailsWidget(),
                  ButtonsTabBar(
                    backgroundColor: Colors.red,
                    borderWidth: 2,
                    borderColor: Colors.black,
                    labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    // Add your tabs here
                    tabs: const [
                      Tab(icon: Icon(Icons.directions_car), text: "car"),
                      Tab(icon: Icon(Icons.directions_transit), text: "transit"),
                      Tab(icon: Icon(Icons.directions_bike)),
                      Tab(icon: Icon(Icons.directions_car)),
                      Tab(icon: Icon(Icons.directions_transit)),
                      Tab(icon: Icon(Icons.directions_bike)),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Center(child: Icon(Icons.directions_car)),
                        Center(child: Icon(Icons.directions_transit)),
                        Center(child: Icon(Icons.directions_bike)),
                        Center(child: Icon(Icons.directions_car)),
                        Center(child: Icon(Icons.directions_transit)),
                        Center(child: Icon(Icons.directions_bike)),
                      ],
                    ),
                  ),
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
