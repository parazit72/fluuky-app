import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/basket_controller.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/raffle_card_widget.dart';
import 'package:get/get.dart';

class RecommendationsForYouSection extends StatefulWidget {
  const RecommendationsForYouSection({super.key});

  @override
  _RecommendationsForYouSectionState createState() => _RecommendationsForYouSectionState();
}

class _RecommendationsForYouSectionState extends State<RecommendationsForYouSection> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();
  final BasketController basketController = Get.find<BasketController>();

  final RaffleController raffleController = Get.find<RaffleController>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final List<Widget> drawItems = raffleController.raffles.map((item) => RaffleCardWidget(raffle: item, viewType: ViewType.list)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        drawItems.isEmpty
            ? Container()
            : Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
                child: Text(
                  t.translate('draws_that_may_interest_you'),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
        drawItems.isEmpty
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    drawItems.length,
                    (index) => GestureDetector(
                      onTap: () {
                        _carouselController.animateToPage(index);
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Container(
                        width: 8.w,
                        height: 8.h,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? FluukyTheme.primaryColor : FluukyTheme.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        drawItems.isEmpty
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(t.translate('Sorry we have nothing to show you right now!')),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  return CarouselSlider.builder(
                    itemCount: drawItems.length,
                    controller: _carouselController,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
                        child: drawItems[index],
                      );
                    },
                    options: CarouselOptions(
                      height: 880.h,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() => _currentIndex = index);
                      },
                    ),
                  );
                },
              ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
