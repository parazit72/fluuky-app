import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_dialog.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:get/get.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: BackgroundScaffold(
        appBar: const AppBarDialog(),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: 0,
                right: 0,
                child: Center(child: Text(t.translate('Your Receipt'), style: Theme.of(context).textTheme.titleMedium)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                child: TicketBackgroundWidget(
                  width: 300,
                  height: 400,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/logo.svg',
                          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        Text('FLUUKY Green Subscription', style: FluukyTheme.lightTheme.textTheme.bodySmall),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text('\$75', style: FluukyTheme.lightTheme.textTheme.titleLarge),
                    ),
                    Text('Paid April 26, 2024', style: FluukyTheme.lightTheme.textTheme.bodySmall),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: DottedLine(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        // lineLength: 100,
                        dashLength: 10,
                        dashColor: FluukyTheme.secondaryColor,
                        dashGapLength: 10,
                        dashGapColor: Colors.transparent,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Receipt Number:', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        Text('9128-1420-4124', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Payment Method:', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        Text('Visa •••• 8275', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: DottedLine(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        // lineLength: 100,
                        dashLength: 10,
                        dashColor: FluukyTheme.secondaryColor,
                        dashGapLength: 10,
                        dashGapColor: Colors.transparent,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Trees Planted:', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        Text('10', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        Text('\$75', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: DottedLine(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        // lineLength: 100,
                        dashLength: 10,
                        dashColor: FluukyTheme.secondaryColor,
                        dashGapLength: 10,
                        dashGapColor: Colors.transparent,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Amount Paid:', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        Text('\$99,99', style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ElevatedButton(onPressed: () => Get.back(), child: Text(t.translate('ok'))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TicketBackgroundWidget extends StatelessWidget {
  final double width;
  final double height;
  final List<Widget> children;

  const TicketBackgroundWidget({
    super.key,
    required this.width,
    required this.height,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/ticket-back-hor.png',
              fit: BoxFit.fill,
            ),
          ),
          // Column with padding
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
