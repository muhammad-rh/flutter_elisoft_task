// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_elisoft_task/constant/color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.label,
  });

  final TextEditingController controller;
  String? Function(String?) validator;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: greenPrimaryColor,
      ),
      child: TextFormField(
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        onSaved: (value) {
          controller.text = value!;
        },
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            color: greenSecondaryColor,
            fontWeight: FontWeight.w600,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
