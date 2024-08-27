import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/repositories/raffle_repository.dart';
import 'package:get/get.dart';

class RaffleController extends GetxController {
  final RaffleRepository raffleRepository;

  var raffles = <RaffleEntity>[].obs;
  var wishlist = <RaffleEntity>[].obs;
  var currentIndex = 0.obs;

  RaffleController({required this.raffleRepository});

  @override
  void onReady() {
    super.onReady();
    fetchWishlist();
  }

  @override
  void onInit() {
    fetchRaffles();
    fetchWishlist();
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

  // Method to fetch wishlist
  void fetchWishlist() async {
    try {
      final fetchedRaffles = await raffleRepository.getRaffles();
      wishlist.assignAll(fetchedRaffles);
    } catch (e) {
      print(e);
    }

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
