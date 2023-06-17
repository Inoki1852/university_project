import 'package:flutter/material.dart';

class CustomEmail extends StatelessWidget {
  final TextEditingController emailController;
  bool isEmailInvalid = false;

  CustomEmail(
      {super.key, required this.emailController, required this.isEmailInvalid});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: isEmailInvalid ? Colors.red : Colors.black,
          ),
        ),
        labelText: 'Email',
        errorText: isEmailInvalid ? 'Wrong e-mail' : null,
        suffixIcon:
            isEmailInvalid ? Icon(Icons.error, color: Colors.red) : null,
      ),
    );
  }
}
