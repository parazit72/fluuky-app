import 'package:fluuky/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getAllCategories();
  Future<void> addCategory(CategoryEntity category);
  Future<void> updateCategory(CategoryEntity category);
  Future<void> deleteCategory(int id);
}
