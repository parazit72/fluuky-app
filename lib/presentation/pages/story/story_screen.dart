import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/story_controller.dart';
import 'package:get/get.dart';

class StoryScreen extends StatelessWidget {
  final StoryController _storyController = Get.put(StoryController());
  final PageController _pageController = PageController();

  final int initialPageIndex;
  StoryScreen({super.key, this.initialPageIndex = 0});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(initialPageIndex);
      _storyController.updateIndex(initialPageIndex); // Keep the index synced
    });

    return Scaffold(
      body: Obx(() {
        if (_storyController.stories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            PageView.builder(
              controller: _pageController, // Connect the PageController

              itemCount: _storyController.stories.length,
              onPageChanged: (index) {
                _storyController.updateIndex(index);
              },
              itemBuilder: (context, index) {
                final storyItem = _storyController.stories[index];
                var t = AppLocalizations.of(context)!;

                return Stack(
                  children: [
                    // Fullscreen image
                    Positioned.fill(child: Image.asset(storyItem.imagePath, fit: BoxFit.cover)),
                    // Overlay content
                    Positioned(
                      top: 120.h,
                      left: 16.w,
                      right: 16.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Close button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(storyItem.title, style: FluukyTheme.lightTheme.textTheme.headlineMedium!.copyWith(color: Colors.white)),
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(Icons.close, color: Colors.white, size: 26.w),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          // Description text
                          Text(storyItem.description, style: TextStyle(color: Colors.white, fontSize: 16.w, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 40.h,
                      left: 20.w,
                      right: 20.w,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            t.translate('View Details'),
                            style: FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: Colors.white),
                          )),
                    ),
                  ],
                );
              },
            ),

            // Indicator
            Positioned(
              top: 64.h,
              left: 0.w,
              right: 0.w,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    ...List.generate(
                      _storyController.stories.length,
                      (i) => Padding(
                        padding: EdgeInsets.only(right: 7.w),
                        child: GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            _storyController.updateIndex(i);
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/images/tree-green.svg',
                                width: 24.w,
                                colorFilter: ColorFilter.mode(i == _storyController.currentIndex.value ? Colors.white : Colors.grey, BlendMode.srcIn),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                // width: 50,
                                margin: EdgeInsets.only(right: 4.w),
                                width: 50.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.w),
                                  color: i == _storyController.currentIndex.value ? Colors.white : Colors.grey,
                                ),
                                height: 4.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
