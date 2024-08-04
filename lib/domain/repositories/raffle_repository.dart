import 'package:fluuky/domain/entities/raffle_entity.dart';

abstract class RaffleRepository {
  Future<List<RaffleEntity>> getRaffles();
  Future<RaffleEntity> getRaffle(int id);
}
