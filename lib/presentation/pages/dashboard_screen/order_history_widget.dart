import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/domain/entities/order_entity.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class OrderHistoryWidget extends StatelessWidget {
  final OrderEntity order;
  final bool showShareButton;

  const OrderHistoryWidget({
    super.key,
    required this.order,
    this.showShareButton = false,
  });

  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text('Share this draw!', style: Theme.of(context).textTheme.titleLarge),
              Text('Choose from one of the following options', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ShareIconButton(
                      iconPath: 'assets/images/email-empty.svg',
                      label: 'Email',
                      order: order,
                    ),
                    ShareIconButton(
                      iconPath: 'assets/images/whatsapp-empty.svg',
                      label: 'Whatsapp',
                      order: order,
                    ),
                    ShareIconButton(
                      iconPath: 'assets/images/telegram-empty.svg',
                      label: 'Telegram',
                      order: order,
                    ),
                    ShareIconButton(
                      iconPath: 'assets/images/facebook-empty.svg',
                      label: 'Facebook',
                      order: order,
                    ),
                    ShareIconButton(
                      iconPath: 'assets/images/instagram-empty.svg',
                      label: 'Instagram',
                      order: order,
                    ),
                    ShareIconButton(
                      iconPath: 'assets/images/x-empty.svg',
                      label: 'X',
                      order: order,
                    ),
                  ],
                ),
              ),
              const Divider(),
              TextButton.icon(
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                ),
                icon: const Icon(Icons.copy, size: 20),
                label: const Text('Copy the link'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Clipboard.setData(ClipboardData(text: 'https://fluuky.com/order/${order.id}'));
                  Get.snackbar('Success', 'Link copied to clipboard');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label, style: Theme.of(context).textTheme.bodySmall), Text(value, style: Theme.of(context).textTheme.titleSmall)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.7 + (showShareButton ? 50 : 0),
      decoration: _buildContainerDecoration(),
      child: Column(
        children: [
          const SizedBox(height: 8),
          if (showShareButton) _buildShareButton(context),
          _buildTicketInfo(context),
          _buildDottedLine(),
          ..._buildOrderDetails(context),
          _buildDottedLine(),
          _buildInfoRow(context, 'Total:', '\$${order.totalPrice?.toStringAsFixed(2)}'),
          _buildDownloadCertificateButton(),
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      image: DecorationImage(image: AssetImage("assets/images/ticket-back-hor.png"), fit: BoxFit.contain),
    );
  }

  Widget _buildShareButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton.icon(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: () => _showShareBottomSheet(context),
        label: const Text('Share'),
        icon: const Icon(Icons.share, size: 18),
      ),
    );
  }

  Widget _buildTicketInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTicketImage(context),
        _buildVerticalDottedLine(),
        _buildTicketNumber(context),
      ],
    );
  }

  Widget _buildTicketImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage('assets/images/bacground.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset('assets/images/ticket-history.jpg', width: MediaQuery.of(context).size.width * 0.5 - 28 - 40, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildVerticalDottedLine() {
    return DottedLine(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      lineLength: 100,
      dashLength: 10,
      dashColor: FluukyTheme.secondaryColor,
      dashGapLength: 10,
      dashGapColor: Colors.transparent,
    );
  }

  Widget _buildTicketNumber(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Ticket Number', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
          Text('#${order.id}', style: Theme.of(context).textTheme.titleMedium)
        ],
      ),
    );
  }

  Widget _buildDottedLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: DottedLine(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        dashLength: 10,
        dashColor: FluukyTheme.secondaryColor,
        dashGapLength: 10,
        dashGapColor: Colors.transparent,
      ),
    );
  }

  List<Widget> _buildOrderDetails(BuildContext context) {
    return [
      _buildInfoRow(context, 'Prize:', order.city ?? ''),
      const SizedBox(height: 16),
      _buildInfoRow(context, 'Draw Date:', order.email.toString()),
      const SizedBox(height: 16),
      _buildInfoRow(context, 'Tickets:', order.id.toString()),
      const SizedBox(height: 16),
      _buildInfoRow(context, 'Trees Planted:', order.id.toString()),
      const SizedBox(height: 16),
      _buildInfoRow(context, 'Transaction ID:', order.city ?? ''),
    ];
  }

  Widget _buildDownloadCertificateButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 20),
      child: OutlinedButton(
        onPressed: () {},
        child: const Text('Download Certificate'),
      ),
    );
  }
}

class ShareIconButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final OrderEntity order;

  const ShareIconButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: IconButton(
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              minimumSize: WidgetStateProperty.all(const Size(0, 0)),
              padding: WidgetStateProperty.all(EdgeInsets.zero),
            ),
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
              child: Center(child: SvgPicture.asset(iconPath, width: 20, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn))),
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () async {
              final result = await Share.share('Check out this raffle: ${order.id}');
              if (result.status == ShareResultStatus.success) {
                Get.snackbar('Success', 'Thank you for sharing');
              }
            },
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
