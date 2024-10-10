import 'package:fluuky/domain/entities/raffle_category_entity.dart';
import 'package:fluuky/domain/repositories/category_repository.dart';
import 'package:hive/hive.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final Box<RaffleCategoryEntity> categoryBox;

  CategoryRepositoryImpl(this.categoryBox);

  @override
  Future<List<RaffleCategoryEntity>> getAllCategories() async {
    return categoryBox.values.toList();
  }

  @override
  Future<void> addCategory(RaffleCategoryEntity category) async {
    await categoryBox.put(category.id, category);
  }

  @override
  Future<void> updateCategory(RaffleCategoryEntity category) async {
    await categoryBox.put(category.id, category);
  }

  @override
  Future<void> deleteCategory(int id) async {
    await categoryBox.delete(id);
  }
}
