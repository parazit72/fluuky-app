import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarFluuky(),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSectionWidget(),
            const SubscriptionSection(),
            const StatusSection(),
            const TreesPlantedSection(),
            const ActiveDrawsSection(),
          ],
        ),
      ),
    );
  }
}
