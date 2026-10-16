import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

// =====================================================
// MODELS + DATA
// =====================================================
import 'models/pet.dart';
import 'data/dummy_pets.dart';

// =====================================================
// ALL SCREENS
// =====================================================
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_pet_screen.dart';
import 'screens/pet_care_awareness_screen.dart';
import 'screens/pet_detail_screen.dart';
import 'screens/check_screen.dart';        // ← NEW

// =====================================================
// MAIN
// =====================================================
void main() {
  runApp(const VetAwareApp());
}

// =====================================================
// VETWARE APP
// =====================================================
class VetAwareApp extends StatelessWidget {
  const VetAwareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetAware AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // =====================================================
      // ⚠️ SCREEN SWITCHER
      // Uncomment ONE line to show that screen.
      // =====================================================

        home: const WelcomeScreen(),
      //  home: const LoginScreen(),
        // home: const SignUpScreen(),
        // home: const HomeScreen(),
        // home: const AddPetScreen(),
        //  home: const PetCareAwarenessScreen(),
        // home: const PetProfileScreen(),
      //  home: const CheckScreen(),               // ← CURRENT
    );
  }
}