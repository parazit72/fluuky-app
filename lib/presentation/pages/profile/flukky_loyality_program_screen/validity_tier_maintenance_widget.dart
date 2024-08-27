import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ValidityTierMaintenanceWidget extends StatelessWidget {
  const ValidityTierMaintenanceWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(47),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/paper-box.png"), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          // boxShadow: [
          //   BoxShadow(color: Color(0xFFDBDBDB)),
          //   BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
          // ],
        ),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            ListTile(
              leading: Image.asset('assets/images/tree-green.png'),
              title: Text('Silver Tier', style: Theme.of(context).textTheme.titleLarge),
            ),
            const Text('Spend 10,000 AED within a rolling 12-month period.'),
            ListTile(
              title: const Text('5% on all draws'),
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  'assets/images/percentage.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
              ),
            ),
            ListTile(
              title: const Text('Exclusive Silver-Tier draws on particular items'),
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  'assets/images/diamond.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
              ),
            ),
            ListTile(
              title: const Text('Free birthday credit to plant a tree and enter any draw'),
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  'assets/images/cake.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
              ),
            ),
          ],
        ));
  }
}
