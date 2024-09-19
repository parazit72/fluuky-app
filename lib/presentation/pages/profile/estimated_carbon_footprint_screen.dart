import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:get/get.dart';

class EstimatedCarbonFootprintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen background image with blur effect
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/ticket-history.jpg', fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Column(
            children: [
              // AppBar with transparent background
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: SvgPicture.asset(
                  'assets/images/fluuky.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: 16,
                ),
                centerTitle: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 56),
                      SvgPicture.asset(
                        'assets/images/globe.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        height: 72,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Estimated Carbon Footprint per Year',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      // Transparent but blurred box with green border
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white10, width: 2),
                          color: Colors.white.withOpacity(0.1), // Semi-transparent background
                        ),
                        child: const Center(
                          child: Text(
                            '43.4 Tons of CO2',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Text below the box
                      const Text(
                        'Knowledge is power! Now that you have your estimate, you can create a plan to take tangible action towards a more sustainable future.',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 64),
                      // Additional information
                      const Text(
                        'Make a Difference',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Subscribe now to plant trees and make a positive impact on the planet—let’s grow a greener tomorrow together!',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/tree-green.svg',
                            height: 32,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 8),
                          const Flexible(
                            child: Text(
                              'Trees to Plant per Month',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white10, width: 2),
                          color: Colors.white.withOpacity(0.1), // Semi-transparent background
                        ),
                        child: const Center(
                          child: Text(
                            '36 Trees',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 64),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/calendar.svg',
                            height: 32,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 8),
                          const Flexible(
                            child: Text(
                              'Carbon Footprint per Month',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white10, width: 2),
                          color: Colors.white.withOpacity(0.1), // Semi-transparent background
                        ),
                        child: const Center(
                          child: Text(
                            '3.6 CO2',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 64),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/dollar.svg',
                            height: 32,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 8),
                          const Flexible(
                            child: Text(
                              'Cost per Month',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white10, width: 2),
                          color: Colors.white.withOpacity(0.1), // Semi-transparent background
                        ),
                        child: const Center(
                          child: Text(
                            '\$288',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 64),
                      // Buttons at the bottom
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Action for Create Plan button
                            },
                            child: const Text('Create Plan'),
                          ),
                          const SizedBox(height: 10),
                          OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: () {
                              Get.toNamed(home);
                            },
                            child: const Text('Go back'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
