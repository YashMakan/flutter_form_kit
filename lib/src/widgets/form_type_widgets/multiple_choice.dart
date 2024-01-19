import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/models/choice_option.dart';
import 'package:flutter_form_kit/src/models/page.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MultipleChoice extends StatefulWidget {
  final FlutterFormPage page;
  final Function(ChoiceOption) onOptionSelected;

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

  optionWidget(int index, ChoiceOption option, context) {
    final themeColor = FlutterFormDetails.of(context).themeColor;
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
              color: themeColor.withOpacity(hoveredIndex == index ? 0.2 : 0.1),
              border: Border.all(color: themeColor),
              borderRadius: BorderRadius.circular(4)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: themeColor),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                        child: Text(
                      alphabet,
                      style: textTheme.bodySmall?.copyWith(
                          color: themeColor, fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    option.label,
                    style: textTheme.titleMedium?.copyWith(color: themeColor),
                  ),
                  if (widget.page.selectedOptions.contains(option))
                    Icon(Icons.check, color: themeColor)
                ],
              ),
              if (option.image!= null) ...[
                SizedBox(
                  height: 5,
                ),
                option.image!.contains('http')
                    ? InkWell(
                        onTap: () => showImageDialog(option.image!),
                        child: Image.network(
                          option.image!,
                          height: 10.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        option.image!,
                        height: 10.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
              ]
            ],
          ),
        ),
      ),
    );
  }

  showImageDialog(String image) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: image.contains('http')
                ? Image.network(image)
                : Image.asset(image),
          ),
        );
      },
    );
  }
}
