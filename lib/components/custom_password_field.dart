import 'package:flutter/material.dart';
import 'package:flutter_elisoft_task/constant/color.dart';

// ignore: must_be_immutable
class CustomPasswordField extends StatefulWidget {
  CustomPasswordField({
    super.key,
    required this.passwordController,
    required this.validator,
    required this.passwordVisible,
  });

  final TextEditingController passwordController;
  String? Function(String?) validator;
  bool passwordVisible;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: greenPrimaryColor,
      ),
      child: TextFormField(
        autofocus: false,
        controller: widget.passwordController,
        keyboardType: TextInputType.text,
        obscureText: !widget.passwordVisible,
        validator: widget.validator,
        onSaved: (value) {
          widget.passwordController.text = value!;
        },
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.passwordVisible = !widget.passwordVisible;
              });
            },
            icon: Icon(
              !widget.passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: greenTertiaryColor,
            ),
          ),
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
