import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/order_history_widget.dart';
import 'package:get/get.dart';
import 'package:fluuky/presentation/controllers/order_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class TransactionsHistoryListHorizentalWidget extends StatefulWidget {
  const TransactionsHistoryListHorizentalWidget({super.key});

  @override
  State<TransactionsHistoryListHorizentalWidget> createState() => _TransactionsHistoryListHorizentalWidgetState();
}

class _TransactionsHistoryListHorizentalWidgetState extends State<TransactionsHistoryListHorizentalWidget> {
  final OrderController orderController = Get.find<OrderController>();

  @override
  void initState() {
    super.initState();
    orderController.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    // if (orderController.orders.isNotEmpty) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.translate('Transactions History'), style: FluukyTheme.lightTheme.textTheme.titleSmall),
                    Text(t.translate('Explore the details of every transaction'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                  ],
                ),
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
          SizedBox(height: 20.h),
          Obx(() {
            if (orderController.isLoading.value) {
              return const CircularProgressIndicator();
            }
            // if (orderController.orders.isEmpty) {
            //   return Text(t.translate('no_orders_found'));
            // } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    3,
                    (index) => Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 28.h),
                      child: Skeletonizer(
                        enabled: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                CircleAvatar(backgroundColor: FluukyTheme.secondaryColor, radius: 16.w),
                                SizedBox(width: 11.w),
                                Text('Referral Code Credit', style: FluukyTheme.lightTheme.textTheme.bodyMedium)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('+\$9.99', style: FluukyTheme.lightTheme.textTheme.bodyMedium),
                                SizedBox(height: 4.h),
                                Text('13 August, 11:22', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
            // }
          }),
        ],
      ),
    );
    // }
    // return Container();
  }
}
