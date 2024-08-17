import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActiveRaffleCardWidget extends StatelessWidget {
  final RaffleEntity raffle;
  final ViewType viewType;

  const ActiveRaffleCardWidget({super.key, required this.raffle, required this.viewType});

  @override
  Widget build(BuildContext context) {
    final isGridView = viewType == ViewType.grid;
    bool loading = false;

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.height * 0.3,
          margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            image: DecorationImage(image: AssetImage('assets/images/paper.jpg'), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(color: Color(0xFFDBDBDB)),
              BoxShadow(color: Colors.white, spreadRadius: 4.0, blurRadius: 8.6),
            ],
          ),
          child: Column(
            children: [
              Skeletonizer(
                ignoreContainers: true,
                enabled: loading,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                    child: raffle.image.isNotEmpty
                        ? CachedNetworkImage(
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            imageUrl: raffle.mainImage,
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                            // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                            cacheManager: CachedNetworkImageProvider.defaultCacheManager,
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeInCurve: Curves.easeIn,
                          )
                        : Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            color: FluukyTheme.secondaryColor,
                          )),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * (isGridView ? 0.66 : 1),
                padding: const EdgeInsets.all(16.0),
                child: Skeletonizer(
                  ignoreContainers: true,
                  enabled: loading,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(raffle.name, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text(raffle.capacity.toString(), style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
