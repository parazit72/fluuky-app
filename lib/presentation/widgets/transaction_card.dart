import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/domain/entities/transaction_entity.dart';

class TransactionCard extends StatelessWidget {
  final TransactionEntity transaction;

  const TransactionCard({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 28.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(backgroundColor: FluukyTheme.secondaryColor, radius: 16.w),
              SizedBox(
                width: 155.w,
                child: Wrap(
                  children: [
                    SizedBox(width: 6.w),
                    Text(transaction.description.toString(), style: FluukyTheme.lightTheme.textTheme.bodyLarge),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(transaction.amount.toString(), style: FluukyTheme.lightTheme.textTheme.bodyLarge),
                  SizedBox(height: 4.h),
                  Text(transaction.createdDate?.toString() ?? '',
                      style: FluukyTheme.lightTheme.textTheme.labelSmall!.copyWith(color: FluukyTheme.thirdColor)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SizedBox(width: 50.w),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/ticket-active.svg',
                    width: 14.w,
                    colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn),
                  ),
                  Text('Tickets: ${transaction.tickets}', style: FluukyTheme.lightTheme.textTheme.labelSmall),
                ],
              ),
              SizedBox(width: 8.w),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/tree-green.svg',
                    width: 14.w,
                    colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn),
                  ),
                  Text('Trees: ${transaction.trees}', style: FluukyTheme.lightTheme.textTheme.labelSmall),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
