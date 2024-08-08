import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoldTierWidget extends StatelessWidget {
  const GoldTierWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(47),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(color: Color(0xFFDBDBDB)),
            BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            ListTile(
              leading: Image.asset('assets/images/tree-green.png'),
              title: Text('Gold Tier', style: Theme.of(context).textTheme.titleLarge),
            ),
            const Text('Spend 25,000 AED within a rolling 12-month period.'),
            ListTile(
              title: const Text('10% on all draws'),
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
              title: const Text('Priority customer service'),
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  'assets/images/support.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
              ),
            ),
            ListTile(
              title: const Text('Access to Silver exclusive draws'),
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  'assets/images/tree-green.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
              ),
            ),
            ListTile(
              title: const Text('Exclusive Gold-Tier draws and events'),
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
              title: const Text('Access to exclusive events or product launches'),
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  'assets/images/rocket.svg',
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
