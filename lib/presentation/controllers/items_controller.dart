import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/domain/entities/winner_category_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:get/get.dart';

enum ItemType { draws, winners, announcements }

enum ViewType { list, grid }

class ItemsController extends GetxController {
  var selectedItemType = ItemType.draws.obs;
  var viewType = ViewType.list.obs;
  var winners = <WinnerEntity>[].obs;
  var winnerCategories = <WinnerCategoryEntity>[].obs;
  var announcements = <AnnouncementEntity>[].obs;
  var winnerCarouselIndex = 0.obs;
  CarouselSliderController carouselSliderController = CarouselSliderController();
}
