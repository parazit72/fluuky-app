import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/repositories/raffle_repository.dart';
import 'package:hive/hive.dart';

class RaffleRepositoryImpl extends RaffleRepository {
  RaffleRepositoryImpl();

  Box<RaffleEntity> get raffleBox => Hive.box<RaffleEntity>('rafflesBox');

  @override
  Future<void> addRaffle(RaffleEntity raffle) async {
    await raffleBox.put(raffle.id, raffle);
  }

  @override
  Future<List<RaffleEntity>> getRaffles() async {
    return raffleBox.values.toList();
  }

  @override
  Future<void> updateRaffle(RaffleEntity raffle) async {
    await raffleBox.put(raffle.id, raffle);
  }

  @override
  Future<void> deleteRaffle(int id) async {
    await raffleBox.delete(id);
  }
}
