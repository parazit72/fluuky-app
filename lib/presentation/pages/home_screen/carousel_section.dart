// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class CarouselSectionWidget extends StatefulWidget {
  @override
  _CarouselSectionWidgetState createState() => _CarouselSectionWidgetState();
}

class _CarouselSectionWidgetState extends State<CarouselSectionWidget> {
  final RaffleController raffleController = Get.find();
  final CarouselSliderController _carouselSliderController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (raffleController.raffles.isEmpty) {
        return Stack(children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: FluukyTheme.secondaryColor,
              child: const Center(child: CircularProgressIndicator())),
        ]);
      }

      return Stack(
        children: [
          CarouselSlider(
            items: raffleController.raffles
                .map(
                  (raffle) => Stack(
                    children: [
                      Skeletonizer(
                        enabled: raffle.image.isEmpty,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.cover,
                          imageUrl: raffle.mainImage,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(raffle.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
                            Text('\$${raffle.price}', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            controller: _carouselSliderController,
            options: CarouselOptions(
                enlargeCenterPage: false,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height * 0.4,
                onPageChanged: (index, reason) => setState(() => _currentIndex = index)),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                onDotClicked: (index) {
                  _carouselSliderController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                activeIndex: _currentIndex,
                count: raffleController.raffles.length,
                effect: ScrollingDotsEffect(
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                  dotHeight: 4.0,
                  dotWidth: (MediaQuery.of(context).size.width - 40) / (raffleController.raffles.length - 1),
                  spacing: 16.0,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
