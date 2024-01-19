import 'package:flutter/material.dart';

import 'page.dart';

class FlutterFormData {
  final String name;
  final Color? themeColor;
  final String? logo;
  final bool showLogo;
  final Color backgroundColor;
  final Duration pageTransitionDuration = const Duration(seconds: 2);
  List<FlutterFormPage> pages;
  final Function(FlutterFormPage page) onPageEdited;
  final Function(List<FlutterFormPage> pages) onFormSubmitted;

  FlutterFormData(
      {required this.name,
      required this.pages,
      this.themeColor,
      this.logo,
      this.backgroundColor = Colors.white,
      this.showLogo = true,
      required this.onPageEdited,
      required this.onFormSubmitted});
}
