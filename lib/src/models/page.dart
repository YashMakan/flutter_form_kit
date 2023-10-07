import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/constants/enums.dart';

class FlutterFormPage {
  final String heading;
  final String? description;
  final String? image;
  final AnswerType answerType;
  final ImageLayout? imageLayout;
  List<String>? options;
  TextEditingController controller = TextEditingController();
  List<String> selectedOptions = [];
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
