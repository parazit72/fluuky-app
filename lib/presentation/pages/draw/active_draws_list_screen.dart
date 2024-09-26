import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/controllers/story_controller.dart';
import 'package:fluuky/presentation/pages/draw/header_stories_avatar_widget.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/category_tabs_section.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class ActiveDrawsListScreen extends StatelessWidget {
  const ActiveDrawsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarFluuky(),
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
