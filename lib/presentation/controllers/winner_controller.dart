import 'package:fluuky/data/repositories/raffle_repository_impl.dart';
import 'package:fluuky/data/repositories/winner_repository_impl.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/domain/entities/raffle_category_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:get/get.dart';

class WinnerController extends GetxController {
  final WinnerRepositoryImpl winnerRepository;
  final RaffleRepositoryImpl raffleRepository;

  var winners = <WinnerEntity>[].obs;
  var announcements = <AnnouncementEntity>[].obs;
  var winnerCategories = <RaffleCategoryEntity>[].obs;

  var selectedCategory = 1.obs;
  var currentIndex = 0.obs;

  WinnerController(this.raffleRepository, {required this.winnerRepository});

  List<WinnerEntity> get filteredRaffles => winners.where((winner) => winner.raffle!.categoryId == selectedCategory.value).toList();

  @override
  void onInit() {
    fetchRaffleCategories();
    fetchWinners();
    super.onInit();
  }

  Future<void> fetchWinners() async {
    try {
      final WinnersResponse fetchedWinnersResponse = await winnerRepository.getWinners();
      winners.assignAll(fetchedWinnersResponse.winners);
      announcements.assignAll(fetchedWinnersResponse.announcements);
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchRaffleCategories() async {
    try {
      final fetchedRaffleCategories = await raffleRepository.getRaffleCategories();
      winnerCategories.assignAll(fetchedRaffleCategories);

      if (winnerCategories.first.id != null) {
        selectedCategory.value = winnerCategories.first.id!;
      }
    } catch (e) {
      print(e);
    }
  }
}
