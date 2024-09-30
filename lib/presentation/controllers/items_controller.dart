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
  var viewType = ViewType.list.obs;
  var winners = <WinnerEntity>[].obs;
  var winnerCategories = <WinnerCategoryEntity>[].obs;
  var announcements = <AnnouncementEntity>[].obs;

  // Initialize with some mock data or fetch from the repository
  @override
  void onInit() {
    super.onInit();

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
}
