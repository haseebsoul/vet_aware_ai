import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/main_shell.dart';
import 'screens/add_pet_screen.dart';
import 'screens/pet_detail_screen.dart';

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

      // The app still starts on the welcome screen.
      initialRoute: '/welcome',

      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),

        // Main application tabs.
        '/home': (context) => const MainShell(),
        '/pets': (context) => const MainShell(initialIndex: 1),
        '/check': (context) => const MainShell(initialIndex: 2),
        '/learn': (context) => const MainShell(initialIndex: 3),
        '/profile': (context) => const MainShell(initialIndex: 4),

        // Other screens remain separate routes.
        '/add-pet': (context) => const AddPetScreen(),
        '/pet-profile': (context) => const PetProfileScreen(),
      },
    );
  }
}