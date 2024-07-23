import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class CarouselSection extends StatefulWidget {
  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  final List<String> _carouselImages = [
    'assets/images/back4.jpg',
    'assets/images/back4.jpg',
    'assets/images/back4.jpg',
  ];

  final CarouselController _carouselController = CarouselController();
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: _carouselImages
              .map(
                (imagePath) => Stack(
                  children: [
                    Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      bottom: 40,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rolex Cosmograph Daytona', style: FluukyTheme.whiteTheme.textTheme.displayMedium),
                          Text('\$99.99', style: FluukyTheme.whiteTheme.textTheme.headlineSmall),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
          carouselController: _carouselController,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.4,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentCarouselIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 24,
          left: 0,
          right: 0,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: _currentCarouselIndex,
              count: _carouselImages.length,
              onDotClicked: (index) {
                _carouselController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
              effect: ScrollingDotsEffect(
                activeDotColor: Colors.white,
                activeDotScale: 1,
                dotColor: Colors.grey,
                dotHeight: 4.0,
                spacing: 16.0,
                dotWidth: (MediaQuery.of(context).size.width / _carouselImages.length) - (_carouselImages.length * 5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
