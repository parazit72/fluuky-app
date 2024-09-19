import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/order_controller.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/order_history_widget.dart';
import 'package:get/get.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class OrderHistoryScreen extends StatelessWidget {
  OrderHistoryScreen({super.key});
  final OrderController _orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('history_order')),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: t.translate('Select Date Range'),
                    border: const OutlineInputBorder(),
                  ),
                  value: _orderController.timeFilter.value.isEmpty ? 'All Time' : _orderController.timeFilter.value,
                  items: [
                    DropdownMenuItem(value: 'All Time', child: Text(t.translate('All Time'))),
                    DropdownMenuItem(value: 'Last 7 Days', child: Text(t.translate('Last 7 Days'))),
                    DropdownMenuItem(value: 'Last 30 Days', child: Text(t.translate('Last 30 Days'))),
                    DropdownMenuItem(value: 'Last 3 Months', child: Text(t.translate('Last 3 Months'))),
                  ],
                  onChanged: (String? newValue) {
                    if (newValue == 'All Time') {
                      _orderController.clearDateRangeFilter();
                    } else {
                      final now = DateTime.now();
                      late DateTimeRange dateRange;
                      switch (newValue) {
                        case 'Last 7 Days':
                          dateRange = DateTimeRange(start: now.subtract(const Duration(days: 7)), end: now);
                          break;
                        case 'Last 30 Days':
                          dateRange = DateTimeRange(start: now.subtract(const Duration(days: 30)), end: now);
                          break;
                        case 'Last 3 Months':
                          dateRange = DateTimeRange(start: now.subtract(const Duration(days: 90)), end: now);
                          break;
                      }
                      _orderController.fetchOrdersByDateRange(dateRange);
                    }
                  },
                ),
                const SizedBox(height: 20),
                Obx(() {
                  final ordersToShow = _orderController.filteredOrders.isNotEmpty ? _orderController.filteredOrders : _orderController.orders;

                  if (ordersToShow.isEmpty) {
                    return Center(
                      child: Text(
                        t.translate('No orders found'),
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ordersToShow.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: OrderHistoryWidget(order: ordersToShow[index], showShareButton: true),
                      );
                    },
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
