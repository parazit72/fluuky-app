import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:get/get.dart';

class UserStatusWidget extends StatelessWidget {
  const UserStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: InkWell(
        onTap: () => Get.toNamed(flukkyLoyalityProgram),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(color: Color(0xFFDBDBDB)),
              BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/leaf-circle-green.svg',
                          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn), width: 16, height: 16),
                      const SizedBox(width: 5),
                      Text('Basic', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/leaf-circle-green.svg',
                          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn), width: 16, height: 16),
                      const SizedBox(width: 5),
                      Text('Silver', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                child: LinearProgressIndicator(
                  value: 0,
                  borderRadius: BorderRadius.circular(50),
                  color: FluukyTheme.accentColor,
                  backgroundColor: FluukyTheme.lightTheme.cardColor,
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('5,000/10,000 AED', style: Theme.of(context).textTheme.bodySmall),
                  Text('12 months left', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Image.asset('assets/images/exclamation-mark.png', width: 20, height: 20),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        'Spend 5,000 AED more before 10 April 2025 to retain your Silver benefits',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
