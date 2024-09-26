import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class BundleSection extends StatelessWidget {
  final String title;
  final String description;
  final String ticketsInfo;
  final String discountInfo;

  const BundleSection({
    required this.title,
    required this.description,
    required this.ticketsInfo,
    required this.discountInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: FluukyTheme.lightTheme.textTheme.titleLarge),
          SizedBox(height: 14.h),
          Text(description, style: FluukyTheme.lightTheme.textTheme.displaySmall),
          SizedBox(height: 21.h),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: FluukyTheme.primaryColor,
                radius: 20.w,
                child: SvgPicture.asset('assets/images/ticket-active.svg',
                    width: 21.h, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              ),
              SizedBox(width: 16.w),
              Text(ticketsInfo, style: FluukyTheme.lightTheme.textTheme.labelMedium),
            ],
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: FluukyTheme.primaryColor,
                radius: 20.w,
                child:
                    SvgPicture.asset('assets/images/percentage.svg', width: 21.h, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              ),
              SizedBox(width: 16.w),
              Flexible(child: Text(discountInfo, style: FluukyTheme.lightTheme.textTheme.labelMedium)),
            ],
          ),
        ],
      ),
    );
  }
}
