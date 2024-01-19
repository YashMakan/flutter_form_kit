import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_kit/src/models/choice_option.dart';
import 'package:flutter_form_kit/src/models/form.dart';
import 'package:flutter_form_kit/src/widgets/custom_button.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';
import 'package:flutter_form_kit/src/widgets/page_changer_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'form_page.dart';

class FlutterForm extends StatefulWidget {
  final FlutterFormData form;

  const FlutterForm({super.key, required this.form});

  @override
  State<FlutterForm> createState() => _FlutterFormState();
}

class _FlutterFormState extends State<FlutterForm> {
  PageController controller = PageController();
  int currentIndex = 0;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ResponsiveSizer(
        builder: (context, orientation, device) => FlutterFormDetails(
              pages: widget.form.pages,
              themeColor: widget.form.themeColor ?? const Color(0xFF0445af),
              onFormSubmitted: (pages) {
                widget.form.onFormSubmitted(pages);
              },
              onPageSubmitted: (index) {
                currentIndex = index;
                onNextPage();
              },
              onPageChanged: (index, value) {
                if (value.runtimeType == String) {
                  TextSelection cursorPosition =
                      widget.form.pages[currentIndex].controller.selection;
                  widget.form.pages[currentIndex].controller.text = value;
                  widget.form.pages[currentIndex].controller.selection =
                      cursorPosition;
                } else if (value.runtimeType == List) {
                  widget.form.pages[currentIndex].selectedOptions =
                      List<ChoiceOption>.from(value);
                }
                currentIndex = index;
                setState(() {});
              },
              child: Focus(
                child: GestureDetector(
                  onTap: () {
                    if (focusNode.canRequestFocus) {
                      focusNode.requestFocus();
                    }
                  },
                  child: RawKeyboardListener(
                    autofocus: true,
                    focusNode: focusNode,
                    onKey: (event) {
                      if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
                        onNextPage();
                      }
                    },
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      floatingActionButton: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PageChangeWidget(
                              controller: controller,
                              index: currentIndex,
                              pagesLength: widget.form.pages.length,
                              onPageChanged: (index) =>
                                  setState(() => currentIndex = index)),
                          if (widget.form.showLogo) ...[
                            const SizedBox(width: 12),
                            CustomButton(
                              text:
                                  widget.form.logo ?? "Powered by FlutterForm",
                              onTap: () {},
                              themeColor: widget.form.themeColor ??
                                  const Color(0xFF0445af),
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ]
                        ],
                      ),
                      body: PageView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const PageScrollPhysics(),
                        controller: controller,
                        itemBuilder: (context, index) =>
                            FormPageView(index: index),
                        itemCount: widget.form.pages.length,
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  onNextPage() {
    controller.animateToPage(currentIndex + 1,
        duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn);
    widget.form.onPageEdited(widget.form.pages[currentIndex]);
  }
}
