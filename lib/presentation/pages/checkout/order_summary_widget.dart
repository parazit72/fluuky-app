import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/billing_address_form_widget.dart';
import 'package:fluuky/presentation/widgets/input_text_field_widget.dart';
import 'package:fluuky/presentation/widgets/payment_form_widget.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class OrderSummaryWidget extends StatelessWidget {
  OrderSummaryWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          ExpandableSection(
            title: t.translate('Order Summary'),
            collapsedContent: _buildCollapsedOrderSummary(context),
            expandedContent: _buildExpandedOrderSummary(context),
          ),
          ExpandableSection(
            title: t.translate('billingAddress'),
            collapsedContent: Text(
              'John Doe / UAE / Dubai / 456 Oak Lane / Suite 789, Riverside Apartments / North Shire / 54321 ',
              style: FluukyTheme.lightTheme.textTheme.labelMedium!.copyWith(color: FluukyTheme.thirdColor),
            ),
            expandedContent: Column(
              children: [
                Text(
                  t.translate('Please enter your phone number and email address.'),
                  style: FluukyTheme.lightTheme.textTheme.displaySmall,
                ),
                SizedBox(height: 24.h),
                BillingAddressFormWidget(formKey: _formKey),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Divider(height: 42.h),
          ),
          ExpandableSection(
            title: t.translate('payment_method'),
            collapsedContent: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/credit-cards/mastercard.png', width: 30.w, height: 30.h),
                SizedBox(width: 24.w),
                Image.asset('assets/credit-cards/amex.png', width: 30.w, height: 30.h),
                SizedBox(width: 24.w),
                Image.asset('assets/credit-cards/elo.png', width: 30.w, height: 30.h)
              ],
            ),
            expandedContent: Column(
              children: [
                Text(
                  t.translate('You’re seconds away from making a positive impact! Please enter your card details below.'),
                  style: FluukyTheme.lightTheme.textTheme.displaySmall,
                ),
                // SizedBox(height: 24.h),
                PaymentFormWidget(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Divider(height: 20.h),
          ),
          ExpandableSection(
            title: t.translate('Promo code'),
            collapsedContent: Text(
              'AB-C1-S312',
              style: FluukyTheme.lightTheme.textTheme.labelMedium!.copyWith(color: FluukyTheme.thirdColor),
            ),
            expandedContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.translate('have_promo_code'),
                  style: FluukyTheme.lightTheme.textTheme.displaySmall,
                ),
                SizedBox(height: 24.h),
                Form(
                    // key: ,
                    child: InputTextFieldWidget(
                        hintText: 'AB-C1-S312', labelText: t.translate('Please enter your promo code below'), controller: codeController)),
                SizedBox(height: 70.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedOrderSummary(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Row(
          children: [
            for (var i = 0; i < 3; i++)
              Wrap(
                children: [
                  Container(
                    height: 46.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: FluukyTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(8.w),
                      border: Border.all(color: FluukyTheme.thirdColor, width: 1),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/cart-img.svg',
                        width: 20.w,
                        height: 16.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedOrderSummary(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final locale = Get.locale;
    String formatNumber(String number) {
      if (locale?.languageCode == 'ar') {
        return Arabic.number(number);
      } else {
        return number;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 24.h),
        ...List.generate(3, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 46.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: FluukyTheme.thirdColor, width: 1),
                    color: FluukyTheme.secondaryColor,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Center(child: SvgPicture.asset('assets/images/cart-img.svg', width: 20.w, height: 16.h, fit: BoxFit.cover)),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item Title',
                        style: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w600, height: 1.5),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ticket-active.svg',
                            width: 16.w,
                            colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn),
                          ),
                          SizedBox(width: 4.w),
                          Text(t.translate('ticketsRemaining')),
                          SizedBox(width: 24.w),
                          SvgPicture.asset(
                            'assets/images/tree-green.svg',
                            width: 16.w,
                            colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn),
                          ),
                          SizedBox(width: 4.w),
                          Text(formatNumber('${t.translate('trees:')} 5')),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        formatNumber('\$50'),
                        style: TextStyle(fontSize: 14.w, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
        const Divider(),
      ],
    );
  }
}

class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget collapsedContent;
  final Widget expandedContent;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.collapsedContent,
    required this.expandedContent,
  });

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: FluukyTheme.lightTheme.textTheme.titleLarge,
                ),
                Icon(_isExpanded ? Icons.expand_less : Icons.expand_more, size: 24.w)
              ],
            ),
          ),
          SizedBox(height: 16.h),
          _isExpanded ? widget.expandedContent : widget.collapsedContent,
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
