import 'package:flutter/material.dart';
import 'features/auth/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Commerce App',
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
