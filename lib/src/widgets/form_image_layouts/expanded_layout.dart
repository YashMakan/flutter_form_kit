import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'basic_layout.dart';

class ExpandedLayout extends StatelessWidget {
  final int index;
  const ExpandedLayout({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final page = FlutterFormDetails.of(context).pages[index];
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
          image: page.image != null
              ? DecorationImage(
                  image: NetworkImage(page.image!), fit: BoxFit.cover)
              : null),
      child: Center(
        child: SizedBox(
          width: 40.w,
          child: BasicLayout(pageIndex: index),
        ),
      ),
    );
  }
}
