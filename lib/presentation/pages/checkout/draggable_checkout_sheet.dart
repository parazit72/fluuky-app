import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/route_constants.dart';

class DraggableCheckoutSheet extends StatefulWidget {
  const DraggableCheckoutSheet({super.key});

  @override
  _DraggableCheckoutSheetState createState() => _DraggableCheckoutSheetState();
}

class _DraggableCheckoutSheetState extends State<DraggableCheckoutSheet> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: DraggableScrollableSheet(
        initialChildSize: 0.32,
        minChildSize: 0.32,
        maxChildSize: 0.32,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
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
          );
        },
      ),
    );
  }
}
