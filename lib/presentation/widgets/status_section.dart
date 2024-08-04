import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x00000014)),
          BoxShadow(color: Colors.white, spreadRadius: 4.0, blurRadius: 8.6),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Status', style: Theme.of(context).textTheme.headlineSmall),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
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
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: LinearProgressIndicator(
              value: 0.7,
              borderRadius: BorderRadius.circular(50),
              color: const Color(0x00318349),
              backgroundColor: const Color(0x00e9efeb),
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
          const SizedBox(height: 10),
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
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Image.asset('assets/images/exclamation-mark.png', width: 20, height: 20),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'Spend 5,000 AED more before 10 April 2025 to retain your Silver benefits',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
