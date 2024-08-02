import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/domain/entities/category_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:get/get.dart';

enum ItemType { draws, winners, announcements }

enum ViewType { list, grid }

class ItemsController extends GetxController {
  var selectedItemType = ItemType.draws.obs;
  var selectedCategory = 1.obs; // ID of the selected category
  var viewType = ViewType.list.obs;

  var categories = <CategoryEntity>[].obs;
  var raffles = <RaffleEntity>[].obs;
  var winners = <WinnerEntity>[].obs;
  var announcements = <AnnouncementEntity>[].obs;

  // Initialize with some mock data or fetch from the repository
  @override
  void onInit() {
    super.onInit();
    categories.assignAll([
      CategoryEntity(id: 1, name: 'watch', description: '', slug: '', status: 1, iconPath: 'watch.svg'),
      CategoryEntity(id: 2, name: 'tree', description: '', slug: '', status: 1, iconPath: 'tree.svg'),
      CategoryEntity(id: 3, name: 'diamond', description: '', slug: '', status: 1, iconPath: 'diamond.svg'),
      CategoryEntity(id: 4, name: 'bag', description: '', slug: '', status: 1, iconPath: 'bag.svg'),
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
          description: '',
          images: [],
          price: 12.5,
          slug: 'fdsfdf'),
      RaffleEntity(
          id: 2,
          name: 'Raffle 2',
          categoryId: 2,
          brandId: 1,
          adminId: 1,
          status: '1,',
          deadline: DateTime.now(),
          capacity: 1,
          description: '',
          images: [],
          price: 12.5,
          slug: 'fdsfdf'),
    ]);
    winners.assignAll([
      WinnerEntity(id: 1, name: 'Winner 1'),
      WinnerEntity(id: 2, name: 'Winner 2'),
    ]);
    announcements.assignAll([
      AnnouncementEntity(id: 1, title: 'Announcement 1'),
      AnnouncementEntity(id: 2, title: 'Announcement 2'),
    ]);
  }

  List<RaffleEntity> get filteredRaffles => raffles.where((raffle) => raffle.categoryId == selectedCategory.value).toList();
}
