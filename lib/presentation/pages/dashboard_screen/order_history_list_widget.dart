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

class OrderHistoryListHorizentalWidget extends StatefulWidget {
  const OrderHistoryListHorizentalWidget({super.key});

  @override
  State<OrderHistoryListHorizentalWidget> createState() => _OrderHistoryListHorizentalWidgetState();
}

class _OrderHistoryListHorizentalWidgetState extends State<OrderHistoryListHorizentalWidget> {
  final OrderController orderController = Get.find<OrderController>();

  @override
  void initState() {
    super.initState();
    orderController.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if (orderController.orders.isNotEmpty) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.translate('orders_history'), style: FluukyTheme.lightTheme.textTheme.titleSmall),
                  Flexible(
                    child: Text(t.translate('see_a_rundown'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => Get.toNamed(orderHistory),
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
            if (orderController.orders.isEmpty) {
              return Text(t.translate('no_orders_found'));
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: orderController.orders.map((order) => OrderHistoryWidget(order: order)).toList(),
                ),
              );
            }
          }),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20.w), child: Divider(height: 48.h)),
        ],
      );
    }
    return Container();
  }
}
