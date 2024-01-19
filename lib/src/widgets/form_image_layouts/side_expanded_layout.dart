import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';
import 'package:flutter_form_kit/src/widgets/form_image_layouts/basic_layout.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SideExpandedLayout extends StatelessWidget {
  final int index;
  final bool isRight;

  const SideExpandedLayout(
      {super.key, this.isRight = true, required this.index});

  @override
  Widget build(BuildContext context) {
    final page = FlutterFormDetails.of(context).pages[index];
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (Device.screenType == ScreenType.tablet)
            if (!isRight)
              (page.image != null)
                  ? Image.network(
                      page.image!,
                      width: 50.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: BasicLayout(pageIndex: index),
            ),
          ),
          if (Device.screenType == ScreenType.tablet)
            if (isRight)
              (page.image != null)
                  ? Image.network(
                      page.image!,
                      width: 50.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
