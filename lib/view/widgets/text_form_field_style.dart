import 'package:flutter/material.dart';

import '../constants/my_text_style.dart';

// ignore: must_be_immutable
class TextFormFieldStyle extends StatelessWidget {
  String title;
  TextFormField textFormField;

  TextFormFieldStyle(
      {required this.title, required this.textFormField, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: MyTextStyle.labelStyle(title),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffe7ecf3),
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: textFormField,
        ),
      ],
    )
    ;
  }
}
