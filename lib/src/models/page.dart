import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/constants/enums.dart';
import 'package:flutter_form_kit/src/models/choice_option.dart';

class FlutterFormPage {
  final String heading;
  final String? description;
  final String? image;
  final AnswerType answerType;
  final ImageLayout? imageLayout;
  /// The options for the form page.
  /// Example:
  /// {
  ///   "label": "Red",
  ///   "value": "red",
  ///   "image": "https://images.unsplash.com/photo-15795469" // Optional
  /// }
  List<ChoiceOption>? options;
  TextEditingController controller = TextEditingController();
  List<ChoiceOption> selectedOptions = [];
  List<String> formField = [];

  FlutterFormPage({
    required this.heading,
    this.description,
    this.image,
    this.imageLayout,
    required this.answerType,
    this.options,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'heading': heading,
      'answerType': answerType.toString(), // Assuming AnswerType is an enum
    };

    if (description != null) {
      json['description'] = description;
    }

    if (image != null) {
      json['image'] = image;
    }

    if (imageLayout != null) {
      json['imageLayout'] =
          imageLayout.toString(); // Assuming ImageLayout is an enum
    }

    if (options != null) {
      json['options'] = options;
    }

    return json;
  }
}
