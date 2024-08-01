import 'package:fluuky/domain/entities/category.dart';
import 'package:fluuky/domain/usecases/get_all_categories_use_case.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  CategoryController(this.getAllCategoriesUseCase);

  var categories = <CategoryEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    final result = await getAllCategoriesUseCase();
    categories.assignAll(result);
  }
}
