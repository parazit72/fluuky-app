// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/custom_dot_indicator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

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
    final locale = Get.locale;

    // Define a method to format numbers based on locale
    String formatNumber(String number) {
      if (locale?.languageCode == 'ar') {
        return Arabic.number(number);
      } else {
        return number;
      }
    }

    return Obx(() {
      if (raffleController.raffles.isEmpty) {
        return Stack(children: [
          Container(height: 260.h, color: FluukyTheme.secondaryColor, child: const Center(child: CircularProgressIndicator())),
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
                          width: 375.w,
                          height: 260.h,
                          fit: BoxFit.cover,
                          imageUrl: raffle.mainImage,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                        ),
                      ),
                      Positioned(
                        top: 157.h,
                        left: 20.w,
                        right: 20.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(raffle.name, style: FluukyTheme.lightTheme.textTheme.titleLarge!.copyWith(color: Colors.white)),
                            Text(
                              formatNumber('\$${raffle.price.toString()}'),
                              style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            controller: _carouselSliderController,
            options: CarouselOptions(
              height: 260.h,
              viewportFraction: 1,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) => setState(() => _currentIndex = index),
            ),
          ),
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 24.h,
            child: CustomDotIndicator(
              activeIndex: _currentIndex,
              count: raffleController.raffles.length,
              onDotClicked: (index) {
                _carouselSliderController.animateToPage(
                  index,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
