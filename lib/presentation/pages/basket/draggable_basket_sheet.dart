import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/route_constants.dart';

class DraggableBasketSheet extends StatefulWidget {
  const DraggableBasketSheet({super.key});

  @override
  _DraggableBasketSheetState createState() => _DraggableBasketSheetState();
}

class _DraggableBasketSheetState extends State<DraggableBasketSheet> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.4,
        minChildSize: 0.4,
        maxChildSize: .9,
        snapSizes: [0.4, 0.75],
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              if (notification.extent > 0.75) {
                Get.toNamed(checkout);
              }
              return true;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:', style: Theme.of(context).textTheme.titleLarge),
                        Text('\$100', style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => Get.toNamed(checkout),
                      child: const Text('Checkout'),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () => Get.toNamed(drawsList),
                      child: const Text('Add more draws'),
                    ),
                    const SizedBox(height: 16),
                    const Text('By completing your purchase you accept our '),
                    Wrap(children: [
                      InkWell(
                        onTap: () => Get.toNamed(termsAndCondition),
                        child: Text('Terms & Conditions', style: TextStyle(color: Theme.of(context).primaryColor)),
                      ),
                      const Text(' and '),
                      InkWell(
                        onTap: () => Get.toNamed(privacyPolicy),
                        child: Text('Privacy Policy', style: TextStyle(color: Theme.of(context).primaryColor)),
                      ),
                    ])
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
