import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'my_pets_screen.dart';
import 'check_screen.dart';
import 'pet_care_awareness_screen.dart';
import 'profile_screen.dart';
import '../widgets/bottom_nav_bar.dart';

// MainShell manages the five main navigation tabs.
class MainShell extends StatefulWidget {
  final int initialIndex;

  const MainShell({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    // Select the tab requested by the route.
    _currentIndex = widget.initialIndex;
  }

  // Change the selected tab.
  void _selectTab(int index) {
    if (_currentIndex == index) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // 0 — Home
          HomeScreen(
            onViewAllPets: () {
              _selectTab(1);
            },
          ),

          // 1 — My Pets
          const MyPetsScreen(),

          // 2 — Health Check
          const CheckScreen(),

          // 3 — Learn
          const PetCareAwarenessScreen(),

          // 4 — Profile
          const ProfileScreen(),
        ],
      ),

      // One shared navigation bar for these five screens.
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTabSelected: _selectTab,
      ),
    );
  }
}