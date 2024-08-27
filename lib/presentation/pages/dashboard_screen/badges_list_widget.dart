import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/presentation/widgets/dashed_circle.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/single_badge_dialog.dart';

class BadgesListWidget extends StatelessWidget {
  const BadgesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text('Badges', style: Theme.of(context).textTheme.titleLarge),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('the more trees you grow the more badges you get!', style: Theme.of(context).textTheme.bodySmall),
        ),
        const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              SizedBox(width: 20),
              BadgeWidget(imagePath: 'assets/images/plus-g.svg', text: 'Eco Guardian', achieved: true),
              BadgeWidget(imagePath: 'assets/images/ticket-active.svg', text: 'Decade of Tickets', achieved: true),
              BadgeWidget(imagePath: 'assets/images/ticket-active.svg', text: 'Green Thumb', achieved: false),
              BadgeWidget(imagePath: 'assets/images/ticket-active.svg', text: 'Silver Ticket History', achieved: false),
              BadgeWidget(imagePath: 'assets/images/ticket-active.svg', text: 'Centennial Sower', achieved: false),
            ])),
      ],
    );
  }
}

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
        margin: const EdgeInsets.only(right: 24),
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
                style: Theme.of(context).textTheme.bodySmall,
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
