import 'package:fluuky/domain/entities/category.dart';
import 'package:fluuky/domain/repositories/category_repository.dart';
import 'package:hive/hive.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final Box<CategoryEntity> categoryBox;

  CategoryRepositoryImpl(this.categoryBox);

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    return categoryBox.values.toList();
  }

  @override
  Future<void> addCategory(CategoryEntity category) async {
    await categoryBox.put(category.id, category);
  }

  @override
  Future<void> updateCategory(CategoryEntity category) async {
    await categoryBox.put(category.id, category);
  }

  @override
  Future<void> deleteCategory(int id) async {
    await categoryBox.delete(id);
  }
}
