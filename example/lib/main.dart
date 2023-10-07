import 'package:flutter/material.dart';
import 'package:flutter_form_kit/flutter_form_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Survey App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FlutterForm(
          form: FlutterFormData(
            name: "Survey Form",
            pages: [
              FlutterFormPage(
                heading: "Basic Information",
                imageLayout: ImageLayout.leftExpanded,
                image: "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                description: "Please provide some basic details.",
                answerType: AnswerType.shortText,
              ),
              FlutterFormPage(
                  heading: "Favorite Color",
                  description: "What's your favorite color?",
                  imageLayout: ImageLayout.rightExpanded,
                  image: "https://images.unsplash.com/photo-1533109721025-d1ae7ee7c1e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                  answerType: AnswerType.multipleChoice,
                  options: ["Red", "Blue", "Green"]
              ),
              FlutterFormPage(
                heading: "Contact Information",
                description: "Let us know how to reach you.",
                answerType: AnswerType.contactInfo,
              ),
              FlutterFormPage(
                heading: "Address",
                description: "Please provide your address.",
                answerType: AnswerType.address,
              ),
              FlutterFormPage(
                heading: "Phone Number",
                description: "What's your phone number?",
                answerType: AnswerType.phoneNumber,
              ),
              FlutterFormPage(
                heading: "Feedback",
                description: "Share your thoughts with us.",
                answerType: AnswerType.longText,
              ),
              FlutterFormPage(
                heading: "Satisfaction",
                description: "Are you satisfied with our service?",
                answerType: AnswerType.yesNo,
              ),
            ],
            onFormSubmitted: (pages) {
              for (var element in pages) {
                debugPrint(element.toJson().toString());
                debugPrint("text: ${element.controller.text}");
                debugPrint("selected options: ${element.selectedOptions}");
                debugPrint("form: ${element.formField}");
                debugPrint("---");
              }
            },
            onPageEdited: (page) {},
          )),
    );
  }
}
