import 'package:fluuky/domain/entities/raffle_category_entity.dart';

abstract class CategoryRepository {
  Future<List<RaffleCategoryEntity>> getAllCategories();
  Future<void> addCategory(RaffleCategoryEntity category);
  Future<void> updateCategory(RaffleCategoryEntity category);
  Future<void> deleteCategory(int id);
}
