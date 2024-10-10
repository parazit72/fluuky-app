import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/data/models/faq_model.dart';

class CustomFAQTile extends StatelessWidget {
  final FaqItem item;
  final VoidCallback onTap;
  final bool isLastItem;
  final bool belowItemExpanded; // Add this field

  const CustomFAQTile({
    super.key,
    required this.item,
    required this.onTap,
    required this.isLastItem,
    required this.belowItemExpanded, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: item.isExpanded ? 16.h : 0),
      decoration: item.isExpanded
          ? const BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black38),
                BoxShadow(color: Color.fromARGB(192, 247, 247, 247), spreadRadius: -4.0, blurRadius: 8.6),
              ],
              color: Color(0XAAF7F7F7),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(item.question,
                          style: FluukyTheme.lightTheme.textTheme.bodyLarge!
                              .copyWith(color: item.isExpanded ? FluukyTheme.inputTextColor : FluukyTheme.thirdColor)),
                    ),
                    Icon(
                      item.isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: item.isExpanded ? FluukyTheme.inputTextColor : FluukyTheme.thirdColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (item.isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Html(
                data: item.answer,
                style: {
                  "p": Style(
                    fontSize: FontSize(12.w),
                    fontWeight: FontWeight.w400,
                    color: FluukyTheme.inputTextColor,
                    fontFamily: FluukyTheme.fontFamily,
                    // height: Height(1.5),
                  ),
                },
              ),
            ),
          // Show Divider only when item is not expanded, it's not the last item, and below item is not expanded
          if (!item.isExpanded && !isLastItem && !belowItemExpanded) Divider(height: 32.h),
        ],
      ),
    );
  }
}
