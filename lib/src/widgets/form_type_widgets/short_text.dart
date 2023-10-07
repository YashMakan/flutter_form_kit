import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';

class ShortText extends StatelessWidget {
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final TextEditingController controller;

  const ShortText(
      {super.key,
      required this.onChanged,
      required this.controller,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeColor = FlutterFormDetails.of(context).themeColor;

    return TextField(
      onChanged: onChanged,
      controller: controller,
      onSubmitted: onSubmitted,
      style: textTheme.headlineMedium,
      cursorColor: themeColor,
      decoration: InputDecoration(
          hintText: "Type your answer here...",
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: themeColor))),
    );
  }
}
