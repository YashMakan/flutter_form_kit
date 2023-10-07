import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';

class LongText extends StatelessWidget {
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final TextEditingController controller;

  const LongText(
      {super.key,
      required this.onChanged,
      required this.controller,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeColor = FlutterFormDetails.of(context).themeColor;

    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      // onFieldSubmitted: onSubmitted,
      style: textTheme.headlineMedium,
      cursorColor: themeColor,
      decoration: InputDecoration(
          hintText: "Type your answer here...",
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: themeColor))),
    );
  }
}
