import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/trees_planted_dialog.dart';
import 'package:fluuky/presentation/widgets/we_forest_info_dialog.dart';

class DrawDetailsWidget extends StatelessWidget {
  const DrawDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Winning this watch means carrying a piece of horological history, a companion for both the high seas and high stakes. It\'s more than a timepiece; it\'s a sustainable heirloom designed to be handed down from generation to generation.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 10),
        Text(
          'Draw Date: December 17th, 2023 - 18:00',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            image: const DecorationImage(image: AssetImage('assets/images/paper.jpg'), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.asset(
                  'assets/images/back4.jpg',
                  alignment: Alignment.topCenter,
                  height: 200,
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Win the', style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(width: 10),
                        Text('Value', style: Theme.of(context).textTheme.bodySmall),
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
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
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
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
