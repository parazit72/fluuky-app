import 'package:fluuky/domain/entities/raffle.dart';

abstract class RaffleRepository {
  Future<void> updateRaffle(RaffleEntity raffle);
  Future<void> addRaffle(RaffleEntity raffle);
  Future<List<RaffleEntity>> getRaffles();
  Future<void> deleteRaffle(int id);
}
