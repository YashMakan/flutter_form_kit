import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/constants/enums.dart';
import 'package:flutter_form_kit/src/models/choice_option.dart';
import 'package:flutter_form_kit/src/widgets/form_type_widgets/address.dart';
import 'package:flutter_form_kit/src/widgets/form_type_widgets/contact_info.dart';
import 'package:flutter_form_kit/src/widgets/form_type_widgets/long_text.dart';
import 'package:flutter_form_kit/src/widgets/form_type_widgets/multiple_choice.dart';
import 'package:flutter_form_kit/src/widgets/form_type_widgets/phone_number.dart';
import 'package:flutter_form_kit/src/widgets/form_type_widgets/short_text.dart';

import 'flutter_form_details.dart';

class AnswerWidget extends StatefulWidget {
  final int index;

  const AnswerWidget({super.key, required this.index});

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return getAnswerWidget();
  }

  getAnswerWidget() {
    final page = FlutterFormDetails.of(context).pages[widget.index];
    switch (page.answerType) {
      case AnswerType.shortText:
        return ShortText(
            onChanged: (value) {
              FlutterFormDetails.of(context).onPageChanged(widget.index, value);
            },
            onSubmitted: (value) {
              FlutterFormDetails.of(context).onPageSubmitted(widget.index);
            },
            controller: page.controller);
      case AnswerType.multipleChoice:
        return MultipleChoice(
            page: page,
            onOptionSelected: (option) {
              if (page.selectedOptions.contains(option)) {
                FlutterFormDetails.of(context)
                    .pages[widget.index]
                    .selectedOptions
                    .remove(option);
              } else {
                FlutterFormDetails.of(context)
                    .pages[widget.index]
                    .selectedOptions
                    .add(option);
              }
              setState(() {});
            });
      case AnswerType.singleChoice:
        return MultipleChoice(
            page: page,
            onOptionSelected: (option) {
              FlutterFormDetails.of(context)
                  .pages[widget.index]
                  .selectedOptions
                  .clear();
              FlutterFormDetails.of(context)
                  .pages[widget.index]
                  .selectedOptions
                  .add(option);
              setState(() {});
            });
      case AnswerType.contactInfo:
        return ContactInfo(
          fields: (fields) {
            FlutterFormDetails.of(context).pages[widget.index].formField =
                fields;
          },
        );
      case AnswerType.address:
        return Address(
          fields: (fields) {
            FlutterFormDetails.of(context).pages[widget.index].formField =
                fields;
          },
        );
      case AnswerType.phoneNumber:
        return PhoneNumber(
            onChanged: (value) {
              FlutterFormDetails.of(context).onPageChanged(widget.index, value);
            },
            onSubmitted: (value) {
              FlutterFormDetails.of(context).onPageSubmitted(widget.index);
            },
            controller: page.controller);
      case AnswerType.longText:
        return LongText(
            onChanged: (value) {
              FlutterFormDetails.of(context).onPageChanged(widget.index, value);
            },
            onSubmitted: (value) {
              FlutterFormDetails.of(context).onPageSubmitted(widget.index);
            },
            controller: page.controller);
      case AnswerType.yesNo:
        page.options = [
          ChoiceOption(label: "YES", value: "yes"),
          ChoiceOption(label: "NO", value: "no"),
        ];
        return MultipleChoice(
          page: page,
          onOptionSelected: (option) {
            FlutterFormDetails.of(context)
                .pages[widget.index]
                .selectedOptions
                .clear();
            FlutterFormDetails.of(context)
                .pages[widget.index]
                .selectedOptions
                .add(option);
            setState(() {});
          },
        );
    }
  }
}
