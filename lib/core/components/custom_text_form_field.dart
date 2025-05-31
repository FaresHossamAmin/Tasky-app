import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasky/main.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.maxLines,
  });
  final String title, hintText;
  final Function(String?)? validator;
  final TextEditingController controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.displaySmall),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator != null
              ? (String? value) => validator!(value)
              : null,
          cursorColor: Colors.white,
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(fontFamily: ""),
          decoration: InputDecoration(hintText: hintText),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
