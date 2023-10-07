import 'page.dart';

class FlutterFormData {
  final String name;
  List<FlutterFormPage> pages;
  final Function(FlutterFormPage page) onPageEdited;
  final Function(List<FlutterFormPage> pages) onFormSubmitted;

  FlutterFormData(
      {required this.name,
      required this.pages,
      required this.onPageEdited,
      required this.onFormSubmitted});
}
