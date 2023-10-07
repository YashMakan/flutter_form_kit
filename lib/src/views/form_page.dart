import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/constants/enums.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';
import 'package:flutter_form_kit/src/widgets/form_image_layouts/expanded_layout.dart';
import 'package:flutter_form_kit/src/widgets/form_image_layouts/in_between_layout.dart';
import 'package:flutter_form_kit/src/widgets/form_image_layouts/side_expanded_layout.dart';
import 'package:flutter_form_kit/src/widgets/form_image_layouts/side_layout.dart';

class FormPageView extends StatefulWidget {
  final int index;
  const FormPageView({super.key, required this.index});

  @override
  State<FormPageView> createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  FlutterFormDetails? formDetails;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      formDetails = FlutterFormDetails.of(context);
      formDetails!.onPageChanged(widget.index, null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getFormPageImageLayout();
  }

  getFormPageImageLayout() {
    final index = widget.index;
    if (formDetails?.pages[index].imageLayout == null) {
      return InBetweenLayout(index: index);
    }
    switch (formDetails!.pages[widget.index].imageLayout!) {
      case ImageLayout.inBetween:
        return InBetweenLayout(index: index);
      case ImageLayout.right:
        return SideLayout(isRight: true, index: index);
      case ImageLayout.left:
        return SideLayout(isRight: false, index: index);
      case ImageLayout.rightExpanded:
        return SideExpandedLayout(isRight: true, index: index);
      case ImageLayout.leftExpanded:
        return SideExpandedLayout(isRight: false, index: index);
      case ImageLayout.background:
        return ExpandedLayout(index: index);
    }
  }
}
