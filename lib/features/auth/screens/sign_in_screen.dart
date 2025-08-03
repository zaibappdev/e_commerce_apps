import 'package:e_commerce_apps/features/auth/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../widgets/custom_gradient_button.dart';
import '../widgets/custom_password_field.dart';
import '../widgets/custom_sign_up_prompt.dart';
import '../widgets/custom_underline_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FA),

      // Body
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(), // no scroll bounce
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 210),

                      const Center(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 56),

                      // Username TextField
                      CustomUnderlineTextField(hintText: 'Username'),
                      const SizedBox(height: 22),

                      // Password
                      const CustomPasswordField(),
                      const SizedBox(height: 42),

                      // Login Button
                      CustomGradientButton(
                        text: 'Login',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 30),

                      // Forget Password?
                      const Center(
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Sign up prompt
                      CustomSignUpPrompt(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      const Spacer(), // balances remaining space
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
