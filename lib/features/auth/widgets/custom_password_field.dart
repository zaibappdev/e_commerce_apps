import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !_obscurePassword,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.black54),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 1.2),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.black54,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    );
  }
}
