import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/transaction_controller.dart';
import 'package:fluuky/presentation/widgets/transaction_card.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class TransactionsHistoryListHorizentalWidget extends StatefulWidget {
  const TransactionsHistoryListHorizentalWidget({super.key});

  @override
  State<TransactionsHistoryListHorizentalWidget> createState() => _TransactionsHistoryListHorizentalWidgetState();
}

class _TransactionsHistoryListHorizentalWidgetState extends State<TransactionsHistoryListHorizentalWidget> {
  final TransactionController transactionController = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if (transactionController.transactions.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(t.translate('Transactions History'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(transactionHistory);
                  },
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerRight,
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                  ),
                  icon: const Icon(Icons.chevron_right),
                )
              ],
            ),
            Text(t.translate('Explore the details of every transaction'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
            SizedBox(height: 20.h),
            Obx(() {
              if (transactionController.isLoading.value) {
                return const CircularProgressIndicator();
              }
              // if (orderController.orders.isEmpty) {
              //   return Text(t.translate('no_orders_found'));
              // } else {
              return Obx(() {
                if (transactionController.isLoading.value) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 16.w),
                        ...List.generate(
                          3,
                          (index) => Skeletonizer(
                              enabled: true,
                              child: Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: SvgPicture.asset(
                                  'assets/images/ticket-empty.svg',
                                  colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.srcIn),
                                  width: 250.w,
                                ),
                              )),
                        ),
                      ],
                    ),
                  );
                }
                if (transactionController.transactions.isEmpty) {
                  return Text(t.translate('no_transactions_found'));
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: transactionController.transactions.map((transaction) => TransactionCard(transaction: transaction)).toList(),
                    ),
                  );
                }
              });
            })
          ],
        ),
      );
    }
    return Container();
  }
}
