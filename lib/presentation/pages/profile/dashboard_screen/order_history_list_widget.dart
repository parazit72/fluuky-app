import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class OrderHistoryListWidget extends StatelessWidget {
  const OrderHistoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Orders History', style: Theme.of(context).textTheme.titleSmall),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text('See a rundown of all your previous ticket purchases.', style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right))
              ],
            ),
          ),
          const SizedBox(height: 20),
          const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                OrderHistoryWidget(),
                OrderHistoryWidget(),
                OrderHistoryWidget(),
                OrderHistoryWidget(),
              ])),
        ],
      ),
    );
  }
}

class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        // image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(color: Color(0xFFDBDBDB)),
          BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage('assets/images/bacground.png'), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset('assets/images/ticket-history.jpg', width: MediaQuery.of(context).size.width * 0.5 - 28 - 40, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DottedLine(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  lineLength: 100,
                  dashLength: 10,
                  dashColor: FluukyTheme.secondaryColor,
                  dashGapLength: 10,
                  dashGapColor: Colors.transparent,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Ticket Number', style: Theme.of(context).textTheme.bodySmall),
                  Text('#2000', style: Theme.of(context).textTheme.titleSmall)
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              dashLength: 10,
              dashColor: FluukyTheme.secondaryColor,
              dashGapLength: 10,
              dashGapColor: Colors.transparent,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Prize:', style: Theme.of(context).textTheme.bodySmall),
              Text('Rolex Cosmograph Daytona', style: Theme.of(context).textTheme.titleSmall)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Draw Date:', style: Theme.of(context).textTheme.bodySmall),
              Text('December 17th, 2023 - 18:00', style: Theme.of(context).textTheme.titleSmall)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Tickets:', style: Theme.of(context).textTheme.bodySmall), Text('1', style: Theme.of(context).textTheme.titleSmall)],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trees Planted:', style: Theme.of(context).textTheme.bodySmall),
              Text('1', style: Theme.of(context).textTheme.titleSmall)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Transaction ID:', style: Theme.of(context).textTheme.bodySmall),
              Text('0123456789', style: Theme.of(context).textTheme.titleSmall)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              dashLength: 10,
              dashColor: FluukyTheme.secondaryColor,
              dashGapLength: 10,
              dashGapColor: Colors.transparent,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Total:', style: Theme.of(context).textTheme.bodySmall), Text('\$99.99', style: Theme.of(context).textTheme.titleSmall)],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 20), child: OutlinedButton(onPressed: () {}, child: const Text('Download Certificate')))
        ],
      ),
    );
  }
}
