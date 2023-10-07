import 'package:flutter/material.dart';

import 'flutter_form_details.dart';

class PageChangeWidget extends StatelessWidget {
  final PageController controller;
  final int index;
  final int pagesLength;
  final Function(int) onPageChanged;

  const PageChangeWidget(
      {super.key,
      required this.controller,
      required this.index,
      required this.pagesLength,
      required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            if (index - 1 >= 0) {
              controller.animateToPage(
                index - 1,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
              );
              onPageChanged(index - 1);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(0),
                ),
                color: FlutterFormDetails.of(context).themeColor),
            width: 32,
            height: 32,
            child: const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: .2),
        InkWell(
          onTap: () {
            if (index < pagesLength - 1) {
              controller.animateToPage(
                index + 1,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
              );
              onPageChanged(index + 1);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(4),
                ),
                color: FlutterFormDetails.of(context).themeColor),
            width: 32,
            height: 32,
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
