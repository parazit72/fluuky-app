import 'package:flutter/material.dart';
import 'package:fluuky/presentation/pages/home_screen/green_subscriber_widget.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/user_status_section.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool userIsSubscribed = true;
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarFluuky(),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSectionWidget(),
            userIsSubscribed ? const GreenSubscriberWidget() : Container(),
            const SubscriptionSection(),
            const UserStatusWidget(),
            const TreesPlantedSection(),
            const ActiveDrawsSection(),
          ],
        ),
      ),
    );
  }
}
