import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class CarouselSectionWidget extends StatelessWidget {
  final RaffleController raffleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (raffleController.raffles.isEmpty) {
        return Stack(children: [
          Image.asset('assets/images/jungle-1.jpg', fit: BoxFit.cover, height: MediaQuery.of(context).size.height * 0.3),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.black.withOpacity(0.5),
          ),
          const SizedBox(height: 260, child: Center(child: CircularProgressIndicator()))
        ]);
      }

      return Stack(
        children: [
          CarouselSlider(
            items: raffleController.raffles
                .map(
                  (raffle) => Stack(
                    children: [
                      Image.asset(
                        raffle.images.isNotEmpty ? raffle.images[0] : 'assets/images/jungle-1.jpg',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                        bottom: 40,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(raffle.name, style: const TextStyle(color: Colors.white, fontSize: 20)),
                            Text('\$${raffle.price}', style: const TextStyle(color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.4,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                // Optionally handle page changes here
              },
            ),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: raffleController.currentIndex.value,
                count: raffleController.raffles.length,
                effect: const ScrollingDotsEffect(
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                  dotHeight: 4.0,
                  dotWidth: 4.0,
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
