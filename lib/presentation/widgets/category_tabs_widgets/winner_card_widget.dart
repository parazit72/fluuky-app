import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class WinnerCardWidget extends StatelessWidget {
  final WinnerEntity winner;

  const WinnerCardWidget({super.key, required this.winner});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.only(bottom: 20.h, right: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: FluukyTheme.secondaryColor,
            radius: 70.w,
            backgroundImage: AssetImage(winner.avatar!),
          ),
          SizedBox(height: 8.h),
          Text(t.translate('WINNER OF THE'), style: FluukyTheme.lightTheme.textTheme.labelSmall!.copyWith(color: FluukyTheme.primaryColor)),
          Text(winner.raffle!.name, style: Theme.of(context).textTheme.bodyMedium),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text('${winner.firstName} ${winner.lastName}', style: FluukyTheme.lightTheme.textTheme.labelSmall),
          ),
          Text(
            DateFormat('d MMMM yyyy').format(winner.raffle!.deadline),
            style: TextStyle(
              fontSize: 12.w,
              fontWeight: FontWeight.w400,
              color: FluukyTheme.thirdColor,
              fontFamily: FluukyTheme.fontFamily,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
