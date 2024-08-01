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
      appBar: AppBarProfile(username: "[Username]"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSectionWidget(),
            const SubscriptionSection(),
            StatusSection(),
            const TreesPlantedSection(),
            const ActiveDrawsSection(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
