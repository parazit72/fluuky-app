import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/widgets/payment_form_widget.dart';
import 'package:get/get.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class SubscribingProcessScreen extends StatefulWidget {
  const SubscribingProcessScreen({super.key});

  @override
  _SubscribingProcessScreenState createState() => _SubscribingProcessScreenState();
}

class _SubscribingProcessScreenState extends State<SubscribingProcessScreen> with SingleTickerProviderStateMixin {
  bool isExpanded = true;
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Start the expanded state based on initial isExpanded value
    if (isExpanded) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
      isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('green_subscription')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(t.translate('My Subscription'), style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(
                    t.translate(
                        'With a simple monthly commitment, you not only contribute to a greener planet by funding tree planting but also get a chance to win in exclusive draws!'),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/logo.svg',
                              colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 16),
                            Text(t.translate('Planter Package'),
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: FluukyTheme.primaryColor)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(t.translate('120 Trees'), style: Theme.of(context).textTheme.titleLarge),
                        Text('${t.translate('Billing starts:')} April 26, 2024',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
                        const Divider(),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(t.translate("Monthly Tree Planting:")),
                          Text(t.translate("10 Trees")),
                        ]),
                        const Divider(),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(t.translate("Total Monthly Subscription:")),
                          Text(t.translate("\$75")),
                        ]),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(t.translate('Payment Method'), style: Theme.of(context).textTheme.titleLarge),
                      IconButton(
                        onPressed: _toggleExpansion,
                        icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  SizeTransition(
                    sizeFactor: _animation,
                    axisAlignment: -1.0, // Expands from the top
                    child: Column(
                      children: [
                        Text(
                          t.translate('Almost there! Add your payment details to secure your subscription.'),
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor),
                        ),
                        PaymentFormWidget(),
                        const SizedBox(height: 24),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 24),
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       // Get.toNamed(greenSubscription);
                        //     },
                        //     child: Text(t.translate('Continue')),
                        //   ),
                        // ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                t.translate('By completing your purchase you accept our '),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () => Get.toNamed(termsAndCondition),
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size(0, 0),
                                      padding: const EdgeInsets.all(4),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(t.translate('terms_conditions')),
                                  ),
                                  Text(
                                    t.translate('_and_'),
                                    style: Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.center,
                                  ),
                                  TextButton(
                                    onPressed: () => Get.toNamed(privacyPolicy),
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(4),
                                      minimumSize: const Size(0, 0),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(t.translate('privacy_policy')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
