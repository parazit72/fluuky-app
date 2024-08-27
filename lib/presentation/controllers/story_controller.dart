import 'package:fluuky/data/models/story_model.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  var stories = <StoryItem>[].obs;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStories(); // Fetch stories when the controller is initialized
  }

  void fetchStories() {
    // Mock fetching stories
    stories.value = [
      StoryItem(
        imagePath: 'assets/images/back4.jpg',
        title: 'Story 1',
        description: 'Description for story 1',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),
      StoryItem(
        imagePath: 'assets/images/back6.jpg',
        title: 'Story 2',
        description: 'Description for story 2',
        iconPath: 'assets/images/tree-green.svg',
      ),

      // Add more stories here
    ];
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
