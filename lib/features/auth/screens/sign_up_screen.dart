import 'package:e_commerce_apps/features/auth/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_gradient_button.dart';
import '../widgets/custom_password_field.dart';
import '../widgets/custom_underline_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FA),

      // Body
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const SizedBox(height: 75),

                      const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 42),

                      // Form Fields
                      CustomUnderlineTextField(hintText: 'First name'),
                      const SizedBox(height: 22),

                      CustomUnderlineTextField(hintText: 'Last Name'),
                      const SizedBox(height: 22),

                      CustomUnderlineTextField(hintText: 'Email'),
                      const SizedBox(height: 22),

                      const CustomPasswordField(),
                      const SizedBox(height: 22),

                      const CustomPasswordField(),
                      const SizedBox(height: 38),

                      // Button
                      CustomGradientButton(text: 'Sign Up', onTap: () {}),

                      const SizedBox(height: 32),

                      // Already have account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignInScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
