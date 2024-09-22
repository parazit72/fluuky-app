import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/draw/draw_details.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class BasketItemWidget extends StatelessWidget {
  final dynamic item;

  const BasketItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.raffle.name, style: FluukyTheme.lightTheme.textTheme.titleLarge),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              TextButton.icon(
                style: ButtonStyle(padding: WidgetStateProperty.all(const EdgeInsets.all(0)), minimumSize: WidgetStateProperty.all(const Size(0, 0))),
                onPressed: () {},
                icon: const Icon(Icons.favorite, size: 18),
                label: Text(t.translate('add_to_wishlist')),
              ),
              TextButton.icon(
                style: ButtonStyle(minimumSize: WidgetStateProperty.all(const Size(0, 0))),
                onPressed: () {},
                icon: const Icon(Icons.delete, size: 18),
                label: Text(t.translate('delete')),
              ),
            ],
          ),
          Skeletonizer(
            enabled: false,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
                imageUrl: item.raffle.mainImage,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade300,
                  child: const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(color: Color(0xFFDBDBDB)),
                  BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                ],
              ),
              child: const BottomOfDrawCardWidget()),
          const Divider(height: 48),
        ],
      ),
    );
  }
}
