import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/domain/entities/category_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/entities/winner_category_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:get/get.dart';

enum ItemType { draws, winners, announcements }

enum ViewType { list, grid }

class ItemsController extends GetxController {
  var selectedItemType = ItemType.draws.obs;
  var selectedCategory = 1.obs; // ID of the selected category
  var viewType = ViewType.list.obs;

  var raffleCategories = <CategoryEntity>[].obs;
  var raffles = <RaffleEntity>[].obs;
  var winners = <WinnerEntity>[].obs;
  var winnerCategories = <WinnerCategoryEntity>[].obs;
  var announcements = <AnnouncementEntity>[].obs;

  // Initialize with some mock data or fetch from the repository
  @override
  void onInit() {
    super.onInit();
    raffleCategories.assignAll([
      CategoryEntity(id: 1, name: 'Watch', description: '', slug: '', status: 1, iconPath: 'watch.svg'),
      CategoryEntity(id: 2, name: 'Tree', description: '', slug: '', status: 1, iconPath: 'tree.svg'),
      CategoryEntity(id: 3, name: 'Diamond', description: '', slug: '', status: 1, iconPath: 'diamond.svg'),
      CategoryEntity(id: 4, name: 'Bag', description: '', slug: '', status: 1, iconPath: 'bag.svg'),
    ]);

    raffles.assignAll([
      RaffleEntity(
          id: 1,
          name: 'Raffle 1',
          categoryId: 1,
          brandId: 1,
          adminId: 1,
          status: '1,',
          deadline: DateTime.now(),
          capacity: 1,
          description: 'description',
          image: [
            "https://fluuky-dev-local.s3.me-south-1.amazonaws.com/images/9cb52e3c-72cb-4cf3-8a16-f3ee1b9f3278.jpg",
            "https://fluuky-dev-local.s3.me-south-1.amazonaws.com/images/9ca14329-21ab-439d-b6a3-590f16bddf4a.png",
            "https://fluuky-dev-local.s3.me-south-1.amazonaws.com/images/9ca1432c-7fd9-47db-831e-23c8ebdf7923.png"
          ],
          mainImage: 'https://fluuky-dev-local.s3.me-south-1.amazonaws.com/images/9cb52e3c-72cb-4cf3-8a16-f3ee1b9f3278.jpg',
          price: 12.5,
          slug: 'fdsfdf',
          isFavorite: false),
      RaffleEntity(
          id: 2,
          name: 'Raffle 2',
          categoryId: 2,
          brandId: 1,
          adminId: 1,
          status: '1,',
          deadline: DateTime.now(),
          capacity: 1,
          description: 'https://fluuky-dev-local.s3.me-south-1.amazonaws.com/images/9cb52e3c-72cb-4cf3-8a16-f3ee1b9f3278.jpg',
          image: [
            "https://fluuky-dev-local.s3.me-south-1.amazonaws.com/images/9cb52e3c-72cb-4cf3-8a16-f3ee1b9f3278.jpg",
            "https://fluuky-dev-local.s3.me-south-1.amazonaws.com/images/9ca14329-21ab-439d-b6a3-590f16bddf4a.png",
            "https://fluuky-dev-local.s3.me-south-1.amazonaws.com/images/9ca1432c-7fd9-47db-831e-23c8ebdf7923.png"
          ],
          mainImage: 'https://fluuky-dev-local.s3.me-south-1.amazonaws.com/images/9cb52e3c-72cb-4cf3-8a16-f3ee1b9f3278.jpg',
          price: 12.5,
          slug: 'fdsfdf'),
    ]);

    winnerCategories.assignAll([
      WinnerCategoryEntity(id: 1, name: 'Watch Winners', description: '', slug: '', status: 1, iconPath: 'watch.svg'),
      WinnerCategoryEntity(id: 2, name: 'Tree Winners', description: '', slug: '', status: 1, iconPath: 'tree.svg'),
      WinnerCategoryEntity(id: 3, name: 'Diamond Winners', description: '', slug: '', status: 1, iconPath: 'diamond.svg'),
      WinnerCategoryEntity(id: 4, name: 'Bag Winners', description: '', slug: '', status: 1, iconPath: 'bag.svg'),
    ]);

    winners.assignAll([
      WinnerEntity(id: 1, name: 'Winner 1', categoryId: 1),
      WinnerEntity(id: 1, name: 'Winner 10', categoryId: 1),
      WinnerEntity(id: 1, name: 'Winner 100', categoryId: 1),
      WinnerEntity(id: 2, name: 'Winner 2', categoryId: 2),
      WinnerEntity(id: 2, name: 'Winner 20', categoryId: 2),
      WinnerEntity(id: 2, name: 'Winner 200', categoryId: 2),
      WinnerEntity(id: 2, name: 'Winner 3', categoryId: 3),
      WinnerEntity(id: 2, name: 'Winner 4', categoryId: 3),
      WinnerEntity(id: 2, name: 'Winner 40', categoryId: 3),
      WinnerEntity(id: 2, name: 'Winner 5', categoryId: 4),
    ]);
    announcements.assignAll([
      AnnouncementEntity(id: 1, title: 'Announcement 1'),
      AnnouncementEntity(id: 2, title: 'Announcement 2'),
      AnnouncementEntity(id: 2, title: 'Announcement 3'),
      AnnouncementEntity(id: 2, title: 'Announcement 4'),
      AnnouncementEntity(id: 2, title: 'Announcement 5'),
      AnnouncementEntity(id: 2, title: 'Announcement 6'),
    ]);
  }

  List<RaffleEntity> get filteredRaffles => raffles.where((raffle) => raffle.categoryId == selectedCategory.value).toList();
}
