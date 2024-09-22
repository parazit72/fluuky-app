import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/basket_controller.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/raffle_card_widget.dart';

class RecommendationsForYouSection extends StatefulWidget {
  final BasketController controller;
  const RecommendationsForYouSection({super.key, required this.controller});

  @override
  _RecommendationsForYouSectionState createState() => _RecommendationsForYouSectionState();
}

class _RecommendationsForYouSectionState extends State<RecommendationsForYouSection> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final List<Widget> drawItems = widget.controller.basket.value.items
        .map((item) => RaffleCardWidget(
              raffle: item.raffle.toEntity(),
              viewType: ViewType.list,
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text(
            t.translate('draws_that_may_interest_you'),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        drawItems.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
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
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? Theme.of(context).primaryColor : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        drawItems.isEmpty
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(t.translate('Sorry we have nothing to show you right now!')),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  final double drawItemHeight = constraints.maxWidth + 30;
                  return CarouselSlider.builder(
                    itemCount: drawItems.length,
                    controller: _carouselController,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                        child: drawItems[index],
                      );
                    },
                    options: CarouselOptions(
                      height: drawItemHeight,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
        const SizedBox(height: 8),
      ],
    );
  }
}
