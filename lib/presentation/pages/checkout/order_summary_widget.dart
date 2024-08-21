import 'package:flutter/material.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({super.key});

  @override
  _OrderSummaryWidgetState createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ],
        ),
        if (!_isExpanded)
          Row(
            children: [
              for (var i = 0; i < 3; i++) // Placeholder for images
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/sample.jpg', // Replace with your image path
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
            ],
          ),
        if (_isExpanded)
          Column(
            children: List.generate(3, (index) {
              // Replace with your order items list
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/sample.jpg', // Replace with your image path
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Item Title', // Replace with your item title
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.confirmation_number, size: 16),
                              SizedBox(width: 4),
                              Text('Tickets: 3'), // Replace with actual data
                              SizedBox(width: 16),
                              Icon(Icons.eco, size: 16),
                              SizedBox(width: 4),
                              Text('Trees: 5'), // Replace with actual data
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$50', // Replace with actual price
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
      ],
    );
  }
}
