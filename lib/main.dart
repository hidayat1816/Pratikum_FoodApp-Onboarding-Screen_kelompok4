import 'package:flutter/material.dart';
import 'Screen/OnboardingScreen.dart';
import 'Screen/ResetEmailSentScreen.dart';
import 'Screen/SignInScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => OnboardingScreen(),
        '/signin': (context) => SignInScreen(),
        '/reset-email-sent': (context) => ResetEmailSentScreen(),
        '/signup': (context) => SignInScreen(),
      },
    );
  }
}
