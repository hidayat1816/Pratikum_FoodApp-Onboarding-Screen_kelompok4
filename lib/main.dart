import 'package:flutter/material.dart';
import 'Screen/OnboardingScreen.dart';
import 'Screen/ResetEmailSentScreen.dart';
import 'Screen/SignInScreen.dart';
import 'Screen/AddToOrderScrreen.dart';
import 'Screen/details_page.dart';
import 'Screen/FeaturedScreen.dart';
import 'Screen/filters_page.dart';
import 'Screen/FoodAppHomeScreen.dart';
import 'Screen/forgot_password_page.dart';
import 'Screen/profile_details_page.dart';
import 'Screen/RestaurantDetailsScreen.dart';
import 'Screen/searchdetails_page.dart';
import 'Screen/signup_page.dart';

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

        // AUTH
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/reset-email-sent': (context) => ResetEmailSentScreen(),

        // MAIN APP
        '/home': (context) => FoodAppHomeScreen(),
        '/featured': (context) => FeaturedScreen(),
        '/filters': (context) => FilterScreen(),

        // DETAILS
        '/details': (context) => OrderDetailsScreen(),
        '/restaurant': (context) => RestaurantDetailsScreen(),
        '/add-to-order': (context) => AddToOrderScrreen(),

        // SEARCH & PROFILE
        '/search': (context) => SearchScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}