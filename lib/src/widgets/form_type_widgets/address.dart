import 'package:flutter/material.dart';
import 'package:flutter_form_kit/src/widgets/flutter_form_details.dart';

class Address extends StatefulWidget {
  final Function(List<String>) fields;
  const Address({super.key, required this.fields});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addressTextField("Address", "65 Hasen Way", context, controller1),
        addressTextField("Address line 2", "Apartment 4", context, controller2),
        addressTextField("City/Town", "Bangalore", context, controller3),
        addressTextField(
            "State/Region/Province", "Karnataka", context, controller4),
        addressTextField("Zip/Post code", "123456", context, controller5),
        addressTextField("Country", "India", context, controller6),
      ],
    );
  }

  addressTextField(label, hint, context, controller) {
    final textTheme = Theme.of(context).textTheme;
    final themeColor = FlutterFormDetails.of(context).themeColor;
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: TextField(
        style: textTheme.headlineMedium,
        controller: controller,
        onChanged: (_){
          widget.fields([
            controller1.text,
            controller2.text,
            controller3.text,
            controller4.text,
            controller5.text,
            controller6.text,
          ]);
        },
        cursorColor: themeColor,
        decoration: InputDecoration(
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(color: themeColor),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            hintText: hint,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: themeColor))),
      ),
    );
  }
}
