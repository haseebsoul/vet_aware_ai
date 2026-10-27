import 'package:flutter/material.dart';

// =====================================================
// BOTTOM NAV BAR — 5 items: Home, Pets, Check, Learn, Profile.
// Now fully clickable with routing.
// The center "Check" is a bigger teal circle.
// =====================================================
class BottomNavBar extends StatelessWidget {
  final int activeIndex;

  const BottomNavBar({super.key, this.activeIndex = 0});

  static const Color cream = Color(0xFFF5F0EA);
  static const Color greyText = Color(0xFF9A9A9A);
  static const Color teal = Color(0xFF2BB5A8);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cream,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Item 1: Home
              _navItem(
                context: context, // 👉 [FIX] Passed context
                icon: Icons.home_rounded,
                label: 'Home',
                index: 0,
                routeName: '/home', 
              ),

              // Item 2: My Pets
              _navItem(
                context: context, // 👉 [FIX] Passed context
                icon: Icons.pets_rounded,
                label: 'Pets',
                index: 1,
                routeName: '/home', // Temporary target
              ),

              // Item 3: CENTER — Check (bigger teal circle).
              _centerCheckButton(context),

              // Item 4: Learn
              _navItem(
                context: context, // 👉 [FIX] Passed context
                icon: Icons.menu_book_rounded,
                label: 'Learn',
                index: 3,
                routeName: '/learn', 
              ),

              // Item 5: Profile
              _navItem(
                context: context, // 👉 [FIX] Passed context
                icon: Icons.person_rounded,
                label: 'Profile',
                index: 4,
                routeName: '/home', // Temporary target
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================================
  // Normal nav item
  // =====================================================
  Widget _navItem({
    required BuildContext context, // 👉 [FIX] Added context parameter
    required IconData icon,
    required String label,
    required int index,
    required String routeName, 
  }) {
    final bool isActive = index == activeIndex;
    final Color color = isActive ? teal : greyText;

    return GestureDetector(
      onTap: () {
        if (!isActive) {
          // Now context is available!
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
      behavior: HitTestBehavior.opaque, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // CENTER ACTION — bigger teal circle for "Check".
  // =====================================================
  Widget _centerCheckButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (activeIndex != 2) {
          Navigator.pushReplacementNamed(context, '/check');
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: teal,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: teal.withOpacity(0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.medical_services_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Check',
            style: TextStyle(
              color: teal,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}