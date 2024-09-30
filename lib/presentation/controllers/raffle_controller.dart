import 'package:fluuky/domain/entities/category_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/repositories/raffle_repository.dart';
import 'package:get/get.dart';

class RaffleController extends GetxController {
  final RaffleRepository raffleRepository;

  var raffles = <RaffleEntity>[].obs;
  var raffleCategories = <CategoryEntity>[].obs;
  var wishlist = <RaffleEntity>[].obs;
  var wishlistToDelete = <int>[].obs;
  var selectedCategory = 1.obs;
  var currentIndex = 0.obs;

  RaffleController({required this.raffleRepository});

  List<RaffleEntity> get filteredRaffles => raffles.where((raffle) => raffle.categoryId == selectedCategory.value).toList();

  @override
  void onReady() {
    super.onReady();
    fetchWishlist();
  }

  @override
  void onInit() {
    fetchRaffles();
    fetchRaffleCategories();
    // fetchWishlist();
    super.onInit();
  }

  Future<void> fetchRaffles() async {
    try {
      final fetchedRaffles = await raffleRepository.getRaffles();
      raffles.assignAll(fetchedRaffles);
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchRaffleCategories() async {
    try {
      final fetchedRaffleCategories = await raffleRepository.getRaffleCategories();
      raffleCategories.assignAll(fetchedRaffleCategories);

      selectedCategory.value = raffleCategories.first.id;
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteSelectedWishlist() async {
    // try {
    //   final fetchedRaffles = await raffleRepository.getRaffles();
    //   raffles.assignAll(fetchedRaffles);
    // } catch (e) {
    //   print(e);
    // }
  }

  // Method to fetch wishlist
  void fetchWishlist() async {
    // try {
    //   final fetchedRaffles = await raffleRepository.getRaffles();
    //   wishlist.assignAll(fetchedRaffles);
    // } catch (e) {
    //   print(e);
    // }

    // wishlist.value = [];
  }

  // Method to add a raffle to the wishlist
  void addToWishlist(RaffleEntity raffle) {
    if (!wishlist.contains(raffle)) {
      wishlist.add(raffle);
    }
  }

  // Method to remove a raffle from the wishlist
  void removeFromWishlist(RaffleEntity raffle) {
    wishlist.remove(raffle);
  }

  // Method to check if a raffle is in the wishlist
  bool isInWishlist(RaffleEntity raffle) {
    return wishlist.contains(raffle);
  }

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
