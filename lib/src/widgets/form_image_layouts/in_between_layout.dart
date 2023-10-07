import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/widgets/form_image_layouts/basic_layout.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InBetweenLayout extends StatelessWidget {
  final int index;

  const InBetweenLayout({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Center(
        child: SizedBox(
          width: 40.w,
          child: BasicLayout(showInline: true, pageIndex: index),
        ),
      ),
    );
  }
}
