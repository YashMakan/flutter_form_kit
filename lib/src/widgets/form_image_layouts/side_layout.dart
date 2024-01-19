import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';
import 'package:flutter_form_kit/src/widgets/form_image_layouts/basic_layout.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SideLayout extends StatelessWidget {
  final bool isRight;
  final int index;

  const SideLayout({super.key, this.isRight = true, required this.index});

  @override
  Widget build(BuildContext context) {
    final page = FlutterFormDetails.of(context).pages[index];
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (Device.screenType == ScreenType.tablet)
              if (!isRight)
                (page.image != null)
                    ? Image.network(
                        page.image!,
                        width: 25.w,
                        height: 25.h,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
            SizedBox(
              width: Device.screenType == ScreenType.tablet ? 40.w : 90.w,
              child: BasicLayout(pageIndex: index),
            ),
            if (Device.screenType == ScreenType.tablet)
              if (isRight)
                (page.image != null)
                    ? Image.network(
                        page.image!,
                        width: 25.w,
                        height: 25.h,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
