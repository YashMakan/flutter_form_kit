import 'package:flutter/material.dart';

class PhoneNumber extends StatelessWidget {
  final bool showLabel;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final TextEditingController controller;

  const PhoneNumber(
      {super.key,
      this.showLabel = false,
      required this.onChanged,
      required this.onSubmitted,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Text(
            "Phone number",
            style: textTheme.titleMedium?.copyWith(color: const Color(0xFF0445af)),
          ),
        ],
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 72,
              child: TextField(
                style: textTheme.headlineMedium,
                cursorColor: const Color(0xFF0445af),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    prefixIcon: Image.network(
                      "https://media.istockphoto.com/id/472317739/vector/flag-of-india.jpg?s=612x612&w=0&k=20&c=ejlQRX4C_Mb40wz1JQcB5vKYcOKlfRtry2W6UcX6mlo=",
                      width: 16,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF0445af)))),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                style: textTheme.headlineMedium,
                onChanged: onChanged,
                controller: controller,
                onSubmitted: onSubmitted,
                cursorColor: const Color(0xFF0445af),
                decoration: InputDecoration(
                    hintText: !showLabel
                        ? "Type your phone number here..."
                        : "(205) 555-013",
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF0445af)))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
