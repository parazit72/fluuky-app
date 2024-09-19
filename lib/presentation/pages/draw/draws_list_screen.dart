import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/controllers/story_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/category_tabs_section.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

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
            const HeaderStoriesAvatarWidget(),
            CarouselSectionWidget(),
            CategoryTabsSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderStoriesAvatarWidget extends StatelessWidget {
  const HeaderStoriesAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final StoryController storyController = Get.find<StoryController>();

    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Color(0xFFDBDBDB)),
        BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
      ]),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Obx(() {
        // List of stories fetched from the StoryController
        final stories = storyController.stories;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: stories.map((storyitem) {
              bool isWatched = storyitem.isWatched;
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(story, arguments: storyitem);
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: isWatched ? const Color(0XFFB3B3B3) : const Color(0XFFADFB4F),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            storyitem.isWatched ? Colors.grey : Colors.transparent,
                            BlendMode.saturation,
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(storyitem.imagePath),
                            child: SvgPicture.asset(
                              storyitem.iconPath,
                              width: 24,
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
