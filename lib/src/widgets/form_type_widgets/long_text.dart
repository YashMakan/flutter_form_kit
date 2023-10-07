import 'package:flutter/material.dart';

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
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      // onFieldSubmitted: onSubmitted,
      style: textTheme.headlineMedium,
      cursorColor: const Color(0xFF0445af),
      decoration: const InputDecoration(
          hintText: "Type your answer here...",
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0445af)))),
    );
  }
}
