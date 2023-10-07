import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/models/page.dart';

class MultipleChoice extends StatefulWidget {
  final FlutterFormPage page;
  final Function(String) onOptionSelected;

  const MultipleChoice(
      {super.key, required this.page, required this.onOptionSelected});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(widget.page.options!.length,
          (index) => optionWidget(index, widget.page.options![index], context)),
    );
  }

  optionWidget(int index, String option, context) {
    final textTheme = Theme.of(context).textTheme;
    String alphabet = String.fromCharCode('A'.codeUnitAt(0) + index);
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          hoveredIndex = null;
        });
      },
      child: GestureDetector(
        onTap: () {
          widget.onOptionSelected(widget.page.options![index]);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          constraints: const BoxConstraints(minWidth: 200),
          decoration: BoxDecoration(
              color: const Color(0xFF0445af)
                  .withOpacity(hoveredIndex == index ? 0.2 : 0.1),
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
                      color: const Color(0xFF0445af),
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(width: 8),
              Text(
                option,
                style: textTheme.titleMedium
                    ?.copyWith(color: const Color(0xFF0445af)),
              ),
              if (widget.page.selectedOptions.contains(option))
                const Icon(Icons.check, color: Color(0xFF0445af))
            ],
          ),
        ),
      ),
    );
  }
}
