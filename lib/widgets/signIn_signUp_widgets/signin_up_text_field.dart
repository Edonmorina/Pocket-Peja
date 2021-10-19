import 'package:flutter/material.dart';
import 'package:pocket_peja/constants/constants.dart';

class SignInUpTextFormField extends StatelessWidget {
  const SignInUpTextFormField(
      {required this.fieldController,
      required this.labelText,
      this.obscureText = false});

  final TextEditingController fieldController;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      style: kTextFieldStyle,
      cursorWidth: 3.0,
      keyboardType: TextInputType.emailAddress,
      controller: fieldController,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        labelText: labelText,
        labelStyle: kTextFieldStyle,
        floatingLabelStyle: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
