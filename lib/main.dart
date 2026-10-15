import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

// =====================================================
// MODELS + DATA
// Needed for PetDetailScreen (it takes a Pet).
// =====================================================
// import 'models/pet.dart';
// import 'data/dummy_pets.dart';

// =====================================================
// ALL SCREENS — imports kept ready.
// =====================================================
import 'screens/welcome_screen.dart';
// import 'screens/login_screen.dart';
//  import 'screens/sign_up_screen.dart';
// import 'screens/home_screen.dart';
// import 'screens/add_pet_screen.dart';
// import 'screens/pet_care_awareness_screen.dart';
// import 'screens/pet_detail_screen.dart';

// =====================================================
// MAIN — starts the app.
// =====================================================
void main() {
  runApp(const VetAwareApp());
}

// =====================================================
// VETWARE APP — root of the application.
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
      //
      // Uncomment ONE line below to show that screen.
      // The rest must stay commented.
      //
      // dummyPets indexes:
      //   0 = Bella   (Labrador)
      //   1 = Luna    (Persian Cat)
      //   2 = Max     (German Shepherd)
      //   3 = Coco    (Parrot)
      //   4 = Rocky   (Bulldog)
      // =====================================================

       home: const WelcomeScreen(),            // Screen 1 — Landing
      // home: const LoginScreen(),           // Screen 2 — Login
      //  home: const SignUpScreen(),          // Screen 3 — Sign Up
      // home: const HomeScreen(),            // Screen 4 — Dashboard
      // home: const AddPetScreen(),          // Screen 5 — Add Pet
      // home: const PetCareAwarenessScreen(),// Screen 6 — Pet Care
      // home: PetDetailScreen(pet: dummyPets[0]), // Screen 7 — Pet Detail
    );
  }
}