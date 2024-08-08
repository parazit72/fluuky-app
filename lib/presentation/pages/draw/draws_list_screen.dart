import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/category_tabs_section.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class DrawsListScreen extends StatelessWidget {
  const DrawsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarFluuky(),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSectionWidget(),
            CategoryTabsSection(),
          ],
        ),
      ),
    );
  }
}
