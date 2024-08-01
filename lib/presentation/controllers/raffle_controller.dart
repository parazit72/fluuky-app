import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/repositories/raffle_repository.dart';
import 'package:get/get.dart';

class RaffleController extends GetxController {
  final RaffleRepository raffleRepository;

  var raffles = <RaffleEntity>[].obs;
  var currentIndex = 0.obs;

  RaffleController({required this.raffleRepository});

  @override
  void onInit() {
    fetchRaffles();
    super.onInit();
  }

  Future<void> fetchRaffles() async {
    final fetchedRaffles = await raffleRepository.getRaffles();
    raffles.assignAll(fetchedRaffles);
  }

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
