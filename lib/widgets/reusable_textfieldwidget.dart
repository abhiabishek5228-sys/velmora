import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labeltext;
  final Icon prefixicon;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  const MyWidget({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labeltext,
    this.validator,
    required this.prefixicon,
   this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixicon,
        suffixIcon: suffixIcon,
      

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: labeltext,
      ),
    );
  }
}
