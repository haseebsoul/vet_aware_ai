import 'dart:ui';                              // for ImageFilter
import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../widgets/bottom_nav_bar.dart';

// =====================================================
// PET DETAIL SCREEN — cream theme + blur background.
// Shows the whole pet (BoxFit.contain) over a blurred
// version of the same image. No cropping, no empty space.
// =====================================================
class PetDetailScreen extends StatelessWidget {
  // The pet this screen shows.
  final Pet pet;

  const PetDetailScreen({super.key, required this.pet});

  // Local color palette.
  static const Color cream = Color(0xFFF5F0EA);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF1F2421);
  static const Color greyText = Color(0xFF7A8781);
  static const Color teal = Color(0xFF2BB5A8);
  static const Color peach = Color(0xFFE89B6F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // -----------------------------------------
            // LAYER 1: BLUR BACKGROUND + SHARP IMAGE.
            // Three stacked layers inside one Stack.
            // -----------------------------------------
            Stack(
              children: [

                // Outer ClipRRect rounds the whole block.
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 380,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [

                        // LAYER 1: Blurred version of the image.
                        // Fills the entire area, no empty space.
                        ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 30,
                            sigmaY: 30,
                          ),
                          child: Image.asset(
                            pet.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // LAYER 2: Soft dark tint over the blur.
                        // Makes the sharp image pop.
                        Container(
                          color: Colors.black.withOpacity(0.15),
                        ),

                        // LAYER 3: Sharp full image on top.
                        // contain = whole pet visible, no crop.
                        Image.asset(
                          pet.imagePath,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),

                // Back button (top-left).
                Positioned(
                  top: 16,
                  left: 16,
                  child: SafeArea(
                    child: _circleButton(Icons.arrow_back_rounded),
                  ),
                ),

                // Heart button (top-right).
                Positioned(
                  top: 16,
                  right: 16,
                  child: SafeArea(
                    child: _circleButton(Icons.favorite_border_rounded),
                  ),
                ),
              ],
            ),

            // -----------------------------------------
            // LAYER 2: INFO SECTION below the image.
            // -----------------------------------------
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // -----------------------------------------
                  // Name + vaccine badge row.
                  // -----------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pet.name,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: darkText,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              pet.breed,
                              style: const TextStyle(
                                fontSize: 14,
                                color: greyText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _vaccineBadge(pet.isVaccinated),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // -----------------------------------------
                  // 3 info boxes — Age, Vaccine, Check-up.
                  // -----------------------------------------
                  Row(
                    children: [
                      Expanded(
                        child: _infoBox(
                          icon: Icons.cake_rounded,
                          label: 'Age',
                          value: '${pet.age} ${pet.age == 1 ? 'yr' : 'yrs'}',
                          color: teal,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _infoBox(
                          icon: Icons.vaccines_rounded,
                          label: 'Vaccine',
                          value: pet.isVaccinated ? 'Done' : 'Pending',
                          color: peach,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _infoBox(
                          icon: Icons.event_available_rounded,
                          label: 'Check-up',
                          value: 'Due soon',
                          color: const Color(0xFF7FB5D8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // -----------------------------------------
                  // Awareness note card.
                  // -----------------------------------------
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardWhite,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: teal.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.info_outline_rounded,
                            color: teal,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Awareness information only. Ask a '
                            'veterinarian about any health concern.',
                            style: TextStyle(
                              fontSize: 13,
                              color: greyText,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // -----------------------------------------
                  // Prepare for Vet Visit button.
                  // -----------------------------------------
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: teal,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Prepare for Vet Visit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom nav — Pets tab active.
      bottomNavigationBar: const BottomNavBar(activeIndex: 1),
    );
  }

  // =====================================================
  // HELPER: Round button on the image.
  // =====================================================
  Widget _circleButton(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: darkText, size: 22),
    );
  }

  // =====================================================
  // HELPER: Vaccine badge pill.
  // =====================================================
  Widget _vaccineBadge(bool isVaccinated) {
    final Color color = isVaccinated ? teal : peach;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isVaccinated
                ? Icons.verified_rounded
                : Icons.warning_amber_rounded,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            isVaccinated ? 'Vaccinated' : 'Not vaccinated',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // HELPER: Small info box (Age, Vaccine, Check-up).
  // =====================================================
  Widget _infoBox({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: cardWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: greyText),
          ),
        ],
      ),
    );
  }
}