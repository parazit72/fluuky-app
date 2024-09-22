import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/single_badge_dialog.dart';
import 'package:fluuky/presentation/widgets/dashed_circle.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 24),
        margin: const EdgeInsets.only(right: 12, left: 12),
        child: Column(
          children: [
            DashedCircle(
                color: achieved ? Colors.transparent : FluukyTheme.secondaryColor,
                strokeWidth: 1,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: achieved ? Theme.of(context).primaryColor : Colors.transparent,
                  ),
                  child: Center(
                    child: achieved
                        ? SvgPicture.asset(
                            imagePath,
                            width: 32,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          )
                        : Container(),
                  ),
                )),
            const SizedBox(height: 8),
            SizedBox(
              width: 56,
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
