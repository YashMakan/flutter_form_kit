import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';
import 'package:flutter_form_kit/src/widgets/form_type_widgets/phone_number.dart';

class ContactInfo extends StatefulWidget {
  final Function(List<String>) fields;

  const ContactInfo({super.key, required this.fields});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        contactInfoTextField("First name", "Jane", context, controller1),
        contactInfoTextField("Last name", "Smith", context, controller2),
        PhoneNumber(
            showLabel: true,
            controller: controller3,
            onChanged: (_) {},
            onSubmitted: (_) {}),
        const SizedBox(height: 32),
        contactInfoTextField("Email", "name@example.com", context, controller4),
        contactInfoTextField(
            "Company", "Acme Corporation", context, controller5),
      ],
    );
  }

  contactInfoTextField(label, hint, context, controller) {
    final themeColor = FlutterFormDetails.of(context).themeColor;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: TextField(
        style: textTheme.headlineMedium,
        controller: controller,
        onChanged: (_) {
          widget.fields([
            controller1.text,
            controller2.text,
            controller3.text,
            controller4.text,
            controller5.text,
          ]);
        },
        cursorColor: themeColor,
        decoration: InputDecoration(
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle:
                textTheme.headlineSmall?.copyWith(color: themeColor),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            hintText: hint,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: themeColor))),
      ),
    );
  }
}
