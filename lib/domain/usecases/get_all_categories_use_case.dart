import 'package:fluuky/domain/entities/category.dart';

import '../repositories/category_repository.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() {
    return repository.getAllCategories();
  }
}
