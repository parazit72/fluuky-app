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
            image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/paper-box.png')),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/leaf-circle-green.svg',
                          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn), width: 16, height: 16),
                      const SizedBox(width: 5),
                      Text('Basic', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/exclamation-mark.png', width: 20, height: 20),
                    const SizedBox(width: 12),
                    Expanded(
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
