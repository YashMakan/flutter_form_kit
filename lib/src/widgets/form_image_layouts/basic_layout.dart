import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/widgets/answer_widget.dart';
import 'package:flutter_form_kit/src/widgets/custom_button.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BasicLayout extends StatelessWidget {
  final bool showInline;
  final int pageIndex;

  const BasicLayout(
      {super.key, this.showInline = false, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final page = FlutterFormDetails.of(context).pages[pageIndex];
    final index = pageIndex;
    final onPageSubmitted = FlutterFormDetails.of(context).onPageSubmitted;
    final onFormSubmitted = FlutterFormDetails.of(context).onFormSubmitted;
    final pagesLength = FlutterFormDetails.of(context).pagesLength;
    final themeColor = FlutterFormDetails.of(context).themeColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "${index + 1}",
              style: textTheme.bodyMedium?.copyWith(color: themeColor),
            ),
            Icon(
              Icons.arrow_forward,
              size: 18,
              color: themeColor,
            ),
            const SizedBox(width: 8),
            Text(
              page.heading,
              style: textTheme.headlineSmall,
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left: 32),
            child: (page.description != null)
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      page.description!,
                      style: textTheme.titleMedium?.copyWith(fontSize: 18),
                    ),
                  )
                : const SizedBox()),
        if (showInline)
          Padding(
              padding: const EdgeInsets.only(left: 32),
              child: (page.image != null)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Image.network(
                        page.image!,
                        width: 25.w,
                        height: 25.h,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox()),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: AnswerWidget(index: index),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: CustomButton(
                text: index == pagesLength - 1 ? "submit" : "OK",
                style: textTheme.headlineSmall?.copyWith(color: Colors.white),
                suffixIcon: index == pagesLength - 1 ? null : Icons.check,
                onTap: () {
                  if (index == pagesLength - 1) {
                    onFormSubmitted(FlutterFormDetails.of(context).pages);
                  } else {
                    onPageSubmitted(index);
                  }
                },
                themeColor: themeColor,
              ),
            ),
            const SizedBox(width: 16),
            if (index != pagesLength - 1)
              Text(
                "press Enter ↵",
                style:
                    textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              )
          ],
        )
      ],
    );
  }
}
