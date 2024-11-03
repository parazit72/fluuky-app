import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

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
