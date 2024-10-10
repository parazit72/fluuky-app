import 'package:fluuky/data/models/faq_model.dart';
import 'package:fluuky/data/repositories/home_repository_impl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var faqs = <FaqItem>[].obs;
  var faqCategories = <FaqCategory>[].obs;
  var ticketBundles = <TicketBundle>[].obs;
  var info = Info(email: '', phone: '').obs;

  final HomeRepositoryImpl _homeRepository;

  HomeController(this._homeRepository);

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void fetchHomeData() async {
    isLoading(true);
    try {
      final response = await _homeRepository.getHomeInfo();
      if (response != null) {
        // Process FAQs

        faqCategories.assignAll((response['faqs'] as List).map((e) => FaqCategory.fromJson(e)).toList());

        faqs.assignAll(faqCategories.expand((category) => category.faqs).toList());

        // Process Ticket Bundles
        ticketBundles.assignAll((response['ticket_bundles'] as List).map((e) => TicketBundle.fromJson(e)).toList());

        // Process Info
        info.value = Info.fromJson(response['info']);
      }
    } finally {
      isLoading(false);
    }
  }
}
