import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/controllers/story_controller.dart';
import 'package:get/get.dart';

class HeaderStoriesAvatarWidget extends StatelessWidget {
  const HeaderStoriesAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final StoryController storyController = Get.find<StoryController>();

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: FluukyTheme.secondaryColor),
        const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
      ]),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Obx(() {
        // List of stories fetched from the StoryController
        final stories = storyController.stories;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: stories.map((storyitem) {
              bool isWatched = storyitem.isWatched;
              return Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(story, arguments: storyitem);
                  },
                  child: CircleAvatar(
                    radius: 24.w,
                    backgroundColor: isWatched ? FluukyTheme.fifthColor : FluukyTheme.phosphorColor,
                    child: ClipOval(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          storyitem.isWatched ? Colors.grey : Colors.transparent,
                          BlendMode.saturation,
                        ),
                        child: CircleAvatar(
                          radius: 22.w,
                          backgroundImage: AssetImage(storyitem.imagePath),
                          child: SvgPicture.asset(
                            storyitem.iconPath,
                            width: 20.w,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
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
