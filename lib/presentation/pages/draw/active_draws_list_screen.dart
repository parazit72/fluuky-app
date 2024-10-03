import 'package:flutter/material.dart';
import 'package:fluuky/presentation/pages/draw/header_stories_avatar_widget.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/category_tabs_section.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class ActiveDrawsListScreen extends StatelessWidget {
  const ActiveDrawsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBarFluuky(),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderStoriesAvatarWidget(),
            CarouselSectionWidget(),
            CategoryTabsSection(),
          ],
        ),
      ),
    );
  }
}
