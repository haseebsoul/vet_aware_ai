import 'package:flutter/material.dart';

// Shared bottom navigation for VetAware AI.
// The MainShell controls the selected tab.
// activeIndex is kept for older screens that still use it.
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTabSelected;

  const BottomNavBar({
    super.key,
    int? currentIndex,
    int? activeIndex,
    this.onTabSelected,
  }) : currentIndex = currentIndex ?? activeIndex ?? 0;

  static const Color cream = Color(0xFFF5F0EA);
  static const Color teal = Color(0xFF2BB5A8);
  static const Color greyText = Color(0xFF9A9A9A);
  static const Color mintLight = Color(0xFFEAF6F0);

  // Handle a tap on a navigation item.
  void _handleTap(BuildContext context, int index) {
    // MainShell supplies this callback.
    if (onTabSelected != null) {
      onTabSelected!(index);
      return;
    }

    // Compatibility for older screens using activeIndex.
    if (index == currentIndex) {
      return;
    }

    const List<String> routes = [
      '/home',
      '/pets',
      '/check',
      '/learn',
      '/profile',
    ];

    Navigator.pushReplacementNamed(context, routes[index]);
  }

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
          height: 78,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Every tab receives exactly one-fifth of the width.
              final double tabWidth = constraints.maxWidth / 5;
              final bool checkSelected = currentIndex == 2;

              return Stack(
                children: [
                  // Animated bubble behind the selected item.
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOutCubic,
                    left: checkSelected
                        ? (2 * tabWidth) + (tabWidth - 58) / 2
                        : (currentIndex * tabWidth) + 7,
                    top: checkSelected ? 5 : 17,
                    width: checkSelected ? 58 : tabWidth - 14,
                    height: checkSelected ? 56 : 42,
                    child: IgnorePointer(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOutCubic,
                        decoration: BoxDecoration(
                          color: checkSelected
                              ? mintLight
                              : Colors.white,
                          borderRadius: BorderRadius.circular(
                            checkSelected ? 30 : 18,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Five equally spaced tabs.
                  Row(
                    children: [
                      _buildTab(
                        context,
                        index: 0,
                        icon: Icons.home_rounded,
                        label: 'Home',
                      ),
                      _buildTab(
                        context,
                        index: 1,
                        icon: Icons.pets_rounded,
                        label: 'Pets',
                      ),
                      _buildCheckTab(context),
                      _buildTab(
                        context,
                        index: 3,
                        icon: Icons.menu_book_rounded,
                        label: 'Learn',
                      ),
                      _buildTab(
                        context,
                        index: 4,
                        icon: Icons.person_rounded,
                        label: 'Profile',
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Normal tab: icon and label.
  Widget _buildTab(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = currentIndex == index;
    final Color color = isSelected ? teal : greyText;

    return Expanded(
      child: InkWell(
        onTap: () => _handleTap(context, index),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 23,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: isSelected
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Larger teal action in the center.
  Widget _buildCheckTab(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => _handleTap(context, 2),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: teal,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: teal.withOpacity(0.30),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.medical_services_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Check',
                style: TextStyle(
                  color: currentIndex == 2 ? teal : greyText,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}