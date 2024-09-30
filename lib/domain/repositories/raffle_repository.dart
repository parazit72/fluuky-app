import 'package:fluuky/domain/entities/category_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';

abstract class RaffleRepository {
  Future<List<RaffleEntity>> getRaffles();
  Future<List<CategoryEntity>> getRaffleCategories();
  Future<List<RaffleEntity>> getWishlistRaffles();
  Future<RaffleEntity> getRaffle(int id);
}
