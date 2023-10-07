import 'package:flutter/material.dart';

class YesNo extends StatelessWidget {
  const YesNo({super.key});

  @override
  Widget build(BuildContext context) {
    final options = ["YES", "NO"];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(options.length,
          (index) => optionWidget(index, options[index], context)),
    );
  }

  optionWidget(int index, String option, context) {
    final textTheme = Theme.of(context).textTheme;
    String alphabet = index % 2 == 0 ? "Y" : "N";
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      constraints: const BoxConstraints(minWidth: 200),
      decoration: BoxDecoration(
          color: const Color(0xFF0445af).withOpacity(0.1),
          border: Border.all(color: const Color(0xFF0445af)),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF0445af)),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
                child: Text(
              alphabet,
              style: textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF0445af), fontWeight: FontWeight.bold),
            )),
          ),
          const SizedBox(width: 8),
          Text(
            option,
            style: textTheme.titleMedium?.copyWith(color: const Color(0xFF0445af)),
          )
        ],
      ),
    );
  }
}
