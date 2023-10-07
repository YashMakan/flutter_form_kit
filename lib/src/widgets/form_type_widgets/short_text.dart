import 'package:flutter/material.dart';

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
    return TextField(
      onChanged: onChanged,
      controller: controller,
      onSubmitted: onSubmitted,
      style: textTheme.headlineMedium,
      cursorColor: const Color(0xFF0445af),
      decoration: const InputDecoration(
          hintText: "Type your answer here...",
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0445af)))),
    );
  }
}
