import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                    Positioned.fill(
                      child: Image.asset(
                        storyItem.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Overlay content
                    Positioned(
                      top: 80,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          // Title and Close button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                storyItem.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.close, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Description text
                          Text(
                            storyItem.description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 20,
                      right: 20,
                      child: ElevatedButton(onPressed: () {}, child: Text(t.translate('View Details'))),
                    ),
                  ],
                );
              },
            ),

            // Indicator
            Positioned(
              top: 50,
              left: 16,
              right: 16,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  // SizedBox(width: 10),
                  ...List.generate(
                    _storyController.stories.length,
                    (i) => GestureDetector(
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
                            width: 24,
                            colorFilter: ColorFilter.mode(i == _storyController.currentIndex.value ? Colors.white : Colors.grey, BlendMode.srcIn),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            // width: 50,
                            margin: const EdgeInsets.only(right: 4),
                            width: (MediaQuery.of(context).size.width - 40) / 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: i == _storyController.currentIndex.value ? Colors.white : Colors.grey,
                            ),
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        );
      }),
    );
  }
}
