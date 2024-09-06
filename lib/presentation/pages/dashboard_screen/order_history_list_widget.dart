import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/order_history_widget.dart';
import 'package:get/get.dart';
import 'package:fluuky/presentation/controllers/order_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    if (orderController.orders.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Orders History', style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text('See a rundown of all your previous ticket purchases.', style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(orderHistory);
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
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (orderController.isLoading.value) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      ...List.generate(
                        3,
                        (index) => Skeletonizer(
                            enabled: true,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: SvgPicture.asset(
                                'assets/images/ticket-empty.svg',
                                colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.srcIn),
                                width: MediaQuery.of(context).size.width * 0.75,
                              ),
                            )),
                      ),
                    ],
                  ),
                );
              }
              if (orderController.orders.isEmpty) {
                return const Text('No orders found');
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
            const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider()),
          ],
        ),
      );
    }
    return Container();
  }
}
