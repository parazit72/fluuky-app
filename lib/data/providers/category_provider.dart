import 'package:fluuky/data/repositories/category_repository_impl.dart';
import 'package:fluuky/domain/entities/category_entity.dart';
import 'package:fluuky/domain/repositories/category_repository.dart';
import 'package:fluuky/domain/usecases/get_all_categories_use_case.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryProvider extends GetxService {
  late CategoryRepository categoryRepository;
  late GetAllCategoriesUseCase getAllCategoriesUseCase;

  @override
  void onInit() {
    super.onInit();
    final categoryBox = Hive.box<CategoryEntity>('categoryBox');
    categoryRepository = CategoryRepositoryImpl(categoryBox);
    getAllCategoriesUseCase = GetAllCategoriesUseCase(categoryRepository);
  }
}
