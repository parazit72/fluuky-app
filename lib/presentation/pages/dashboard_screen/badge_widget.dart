import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/single_badge_dialog.dart';

class BadgeWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final bool achieved;
  // final VoidCallback onTap;

  const BadgeWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.achieved,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        achieved
            ? showDialog(
                context: context,
                builder: (BuildContext context) => SingleBadgeScreen(imagePath: imagePath),
              )
            : null;
      },
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: 24),
        margin: const EdgeInsets.only(right: 12, left: 12),
        child: Column(
          children: [
            CircleAvatar(
                backgroundColor: achieved ? FluukyTheme.primaryColor : FluukyTheme.secondaryColor,
                radius: 28.w,
                child: SvgPicture.asset(
                  achieved ? imagePath : 'assets/images/lock.svg',
                  width: achieved ? 32.w : 20.w,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
            SizedBox(height: 8.h),
            SizedBox(
              width: 56.w,
              child: Text(
                text,
                style: FluukyTheme.lightTheme.textTheme.displaySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
