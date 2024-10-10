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
  final ScrollController _scrollController = ScrollController(); // Add ScrollController

  final int initialPageIndex;
  StoryScreen({super.key, this.initialPageIndex = 0});
  int previousIndex = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(initialPageIndex);
      _storyController.updateIndex(initialPageIndex); // Keep the index synced
      _scrollToActiveIndicator(initialPageIndex); // Scroll to initial indicator
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
                if (index > 4 || previousIndex > index) {
                  _scrollToActiveIndicator(index); // Scroll to center active indicator
                  previousIndex = index;
                }
              },
              itemBuilder: (context, index) {
                final storyItem = _storyController.stories[index];
                var t = AppLocalizations.of(context)!;

                return Stack(
                  children: [
                    Positioned.fill(child: Image.asset(storyItem.imagePath, fit: BoxFit.cover)),
                    Positioned(
                      top: 120.h,
                      left: 16.w,
                      right: 16.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(storyItem.title, style: FluukyTheme.lightTheme.textTheme.headlineMedium!.copyWith(color: Colors.white)),
                          SizedBox(height: 16.h),
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
            Positioned(
              top: 120.h,
              right: 16.w,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.close, color: Colors.white, size: 26.w),
              ),
            ),
            Positioned(
              top: 64.h,
              left: 0.w,
              right: 0.w,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController, // Connect the ScrollController
                child: Row(
                  children: [
                    SizedBox(width: 16.w),
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
                            _scrollToActiveIndicator(i); // Scroll to center active indicator
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
                    SizedBox(width: 16.w),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _scrollToActiveIndicator(int index) {
    // Calculate the offset to center the active indicator
    final double screenWidth = Get.width;
    const double indicatorWidth = 50; // Adjust to the actual width of each indicator
    const double padding = 16; // Adjust for left/right padding

    // Center the active indicator
    final double offset = index * (indicatorWidth + 7) - (screenWidth / 2) + (indicatorWidth / 2) + padding;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
