import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintTextInput;
  final IconData icon;
  final bool secureText;
  final TextEditingController? controller;

  const MyTextField({
    super.key,
    required this.hintTextInput,
    required this.icon,
    required this.secureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: secureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintTextInput,
        hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
