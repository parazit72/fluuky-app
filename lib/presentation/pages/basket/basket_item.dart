import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/presentation/pages/draw/trees_planted_dialog.dart';
import 'package:fluuky/presentation/pages/draw/we_forest_info_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BasketItem extends StatelessWidget {
  const BasketItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Draw Title', style: Theme.of(context).textTheme.titleLarge),
          Wrap(
            children: [
              TextButton.icon(
                style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(0, 0))),
                onPressed: () {},
                icon: const Icon(Icons.favorite, size: 18),
                label: const Text('Add to Wishlist'),
              ),
              TextButton.icon(
                style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(0, 0))),
                onPressed: () {},
                icon: const Icon(Icons.delete, size: 18),
                label: const Text('Delete'),
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
                imageUrl: 'assets/images/watch.png',
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
                // image: const DecorationImage(
                //   image: AssetImage('assets/images/paper.jpg'),
                //   fit: BoxFit.cover,
                // ),
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

class BottomOfDrawCardWidget extends StatelessWidget {
  const BottomOfDrawCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Prize', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: 10),
              Text('Rolex Cosmograph Daytona', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rolex Cosmograph Daytona', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: 10),
              Text('\$33,000', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo-green.png', height: 24),
                  const SizedBox(width: 10),
                  Text('Tickets:', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Text('567/2000', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo-green.png', height: 24),
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
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset('assets/images/logo-green.png', height: 24),
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
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              Text('10 Trees', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Image.asset('assets/images/logo-green.png', height: 24),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const TreesPlantedDialog();
                          },
                        );
                      },
                      child: Text(
                        'Bundle Discount:',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              Text('0', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
