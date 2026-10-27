// Hide Flutter's built-in 'LoginScreen' so it uses YOUR LoginScreen.
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_pet_screen.dart';
import 'screens/check_screen.dart';
import 'screens/pet_care_awareness_screen.dart';
import 'screens/profile_screen.dart'; // Make sure this file exists!

void main() {
  runApp(const VetAwareApp());
}

class VetAwareApp extends StatelessWidget {
  const VetAwareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetAware AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/add-pet': (context) => const AddPetScreen(),
        '/check': (context) => const CheckScreen(),
        '/learn': (context) => const PetCareAwarenessScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}