import 'package:flutter/material.dart';

class CustomSignUpPrompt extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomSignUpPrompt({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have account? ",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            onTap: onPressed,
            child: const Text(
              "Sign up",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
