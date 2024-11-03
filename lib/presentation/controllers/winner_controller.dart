import 'package:fluuky/data/repositories/winner_repository_impl.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/domain/entities/winner_category_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:get/get.dart';

class WinnerController extends GetxController {
  final WinnerRepositoryImpl winnerRepository;

  var winners = <WinnerEntity>[].obs;
  var announcements = <AnnouncementEntity>[].obs;
  RxList<WinnerCategoryEntity> winnerCategories = <WinnerCategoryEntity>[].obs;

  var currentIndex = 0.obs;
  var selectedCategory = 1.obs;

  WinnerController({required this.winnerRepository});

  @override
  void onInit() {
    fetchWinners();
    super.onInit();
  }

  Future<void> fetchWinners() async {
    try {
      final WinnersResponse fetchedWinnersResponse = await winnerRepository.getWinners();
      winners.assignAll(fetchedWinnersResponse.winners);
      announcements.assignAll(fetchedWinnersResponse.announcements);

      // Extract winner categories
      winnerCategories.assignAll(
        fetchedWinnersResponse.winners
            .fold<Map<int, List<WinnerEntity>>>({}, (Map<int, List<WinnerEntity>> map, winner) {
              final categoryId = winner.raffle?.categoryId;
              if (categoryId != null) {
                map.putIfAbsent(categoryId, () => []).add(winner); // Group winners by categoryId
              }
              return map;
            })
            .entries
            .map((entry) {
              final categoryId = entry.key;
              final winnersForCategory = entry.value;
              // Create WinnerCategoryEntity for each categoryId
              return WinnerCategoryEntity(
                id: categoryId,
                name: '', // Get category name
                slug: '', // Get category slug
                description: '', // Get category description
                winnerEntities: winnersForCategory, // Assign related winners
              );
            })
            .toList(),
      );
    } catch (e) {
      print(e);
    }
  }
}
