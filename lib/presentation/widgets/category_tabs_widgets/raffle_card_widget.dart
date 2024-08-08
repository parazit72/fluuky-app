import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/pages/draw/we_forest_info_dialog.dart';
import 'package:get/get.dart';

class RaffleCardWidget extends StatelessWidget {
  final RaffleEntity raffle;
  final ViewType viewType;

  const RaffleCardWidget({super.key, required this.raffle, required this.viewType});

  @override
  Widget build(BuildContext context) {
    final isGridView = viewType == ViewType.grid;

    return Column(
      children: [
        isGridView
            ? Container()
            : Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Plant "X" trees to enter the Draw to win: Rolex Cosmograph Daytona',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
        Container(
          // margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
              ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  child: raffle.images.isNotEmpty
                      ? SizedBox(
                          height: isGridView ? 150 : 335,
                          child: CachedNetworkImage(
                            height: isGridView ? 150 : 335,
                            imageUrl: raffle.images[0],
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                            // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                            cacheManager: CachedNetworkImageProvider.defaultCacheManager,
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeInCurve: Curves.easeIn,
                          ),
                        )
                      : Image.asset(
                          'assets/images/jungle-1.jpg',
                          height: 250,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        )),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * (isGridView ? 0.66 : 1),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Win the', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.secondaryColor)),
                        const SizedBox(width: 10),
                        Text('Value', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.secondaryColor)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(raffle.name, style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(width: 10),
                        Text('\$${raffle.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/ticket-active.svg', width: 20),
                            const SizedBox(width: 10),
                            Text('Tickets:', style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                        Text('${raffle.capacity}/2000', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/images/tree-green.svg',
                                height: 18, colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn)),
                            const SizedBox(width: 10),
                            Text('Each ticket plants:', style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                        Text('10 Trees', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.info_outline, size: 18, color: Theme.of(context).primaryColor),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const WeForestInfoScreen();
                                    },
                                  );
                                },
                                child: Text(
                                  'You are planting:',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: FluukyTheme.primaryColor,
                                      decorationColor: FluukyTheme.primaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text('10 Trees', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(onPressed: () => Get.toNamed(draw, arguments: raffle), child: const Text('Buy Tickets Now'))
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32)
      ],
    );
  }
}
