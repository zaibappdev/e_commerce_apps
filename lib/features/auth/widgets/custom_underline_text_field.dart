import 'package:flutter/material.dart';

class CustomUnderlineTextField extends StatelessWidget {
  final String hintText;

  const CustomUnderlineTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 1.2),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
