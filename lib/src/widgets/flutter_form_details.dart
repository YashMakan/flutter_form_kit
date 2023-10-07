import 'package:flutter/widgets.dart';
import 'package:flutter_form_kit/src/models/page.dart';

class FlutterFormDetails extends InheritedWidget {
  final List<FlutterFormPage> pages;
  final Function(int, dynamic) onPageChanged;
  final Function(int) onPageSubmitted;
  final Function(List<FlutterFormPage>) onFormSubmitted;

  int get pagesLength => pages.length;

  const FlutterFormDetails({
    super.key,
    required this.pages,
    required this.onPageChanged,
    required this.onPageSubmitted,
    required this.onFormSubmitted,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static FlutterFormDetails of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FlutterFormDetails>()!;
  }
}
