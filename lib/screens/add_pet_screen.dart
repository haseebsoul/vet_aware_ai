import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

// =====================================================
// ADD PET SCREEN — clean two-section layout.
// Top: descriptive text + button.
// Bottom: clean cat image (no overlay).
// Form opens in glass sheet on tap.
// =====================================================
class AddPetScreen extends StatelessWidget {
  const AddPetScreen({super.key});

  // Palette.
  static const Color cream = Color(0xFFF7F4EF);
  static const Color darkText = Color(0xFF1F2421);
  static const Color greyText = Color(0xFF7A8781);
  static const Color teal = Color(0xFF2BB5A8);
  static const Color pink = Color(0xFFF8E5E0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: Column(
        children: [

          // =========================================
          // SECTION 1: TOP — cream with text + button.
          // =========================================
          Expanded(
            flex: 6,
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: [

                  // Decorative pink blob top-right.
                  Positioned(
                    top: -100,
                    right: -80,
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: pink.withOpacity(0.7),
                      ),
                    ),
                  ),

                  // Content.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 16),

                        // Top bar.
                        Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                color: darkText,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 14),
                            const Text(
                              'Add New Pet',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: darkText,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Heading.
                        const Text(
                          'Bring a new',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                            color: darkText,
                            height: 1.05,
                            letterSpacing: -1,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'friend home',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w800,
                                color: darkText,
                                height: 1.05,
                                letterSpacing: -1,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Icon(
                                Icons.favorite,
                                color: teal,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Paragraph.
                        const Text(
                          'Add your pet\'s details, photos, and health '
                          'records. We\'ll keep everything organized.',
                          style: TextStyle(
                            fontSize: 14,
                            color: greyText,
                            height: 1.55,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 22),

                        // Feature bullets.
                        _featureBullet(
                          Icons.photo_camera_outlined,
                          'Upload photos',
                          'Show your pet at their best.',
                        ),
                        const SizedBox(height: 12),
                        _featureBullet(
                          Icons.medical_information_outlined,
                          'Track health',
                          'Vaccines, checkups, notes — in one.',
                        ),
                        const SizedBox(height: 12),
                        _featureBullet(
                          Icons.notifications_active_outlined,
                          'Smart reminders',
                          'Never miss a vet visit.',
                        ),

                        const Spacer(),

                        // Add Pet button.
                        SizedBox(
                          height: 58,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _openFormSheet(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: teal,
                              foregroundColor: Colors.white,
                              elevation: 8,
                              shadowColor: teal.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(29),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.pets, size: 20),
                                SizedBox(width: 10),
                                Text(
                                  'Add Pet',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // =========================================
          // SECTION 2: BOTTOM — clean cat image.
          // No Stack, no overlay, no gradient.
          // The image is fully visible.
          // =========================================
          Expanded(
            flex: 5,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/pet_care_hero.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),

      // Bottom nav — Pets tab active.
      bottomNavigationBar: const BottomNavBar(activeIndex: 1),
    );
  }

  // =====================================================
  // HELPER: Feature bullet.
  // =====================================================
  Widget _featureBullet(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: teal.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: teal, size: 17),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w800,
                  color: darkText,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: greyText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =====================================================
  // Opens the glass form sheet.
  // =====================================================
  void _openFormSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) => const _AddPetSheet(),
    );
  }
}

// =====================================================
// ADD PET SHEET — glassmorphism form (perfected).
// =====================================================
class _AddPetSheet extends StatelessWidget {
  const _AddPetSheet();

  static const Color darkText = Color(0xFF1F2421);
  static const Color greyText = Color(0xFF7A8781);
  static const Color teal = Color(0xFF2BB5A8);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
            decoration: const BoxDecoration(
              color: Color(0xE6FFF9F0),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  // Drag handle.
                  Center(
                    child: Container(
                      width: 44,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  // ================================
                  // HEADER with teal circle badge.
                  // ================================
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: teal,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: teal.withOpacity(0.4),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.pets_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add New Pet',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: darkText,
                              letterSpacing: -0.4,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Fill in your pet's details.",
                            style: TextStyle(
                              fontSize: 12.5,
                              color: greyText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),

                  // ================================
                  // PHOTO CARD — bigger, more impressive.
                  // ================================
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.95),
                          Colors.white.withOpacity(0.75),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: teal.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: teal,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: teal.withOpacity(0.4),
                                blurRadius: 14,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add a Photo',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: darkText,
                                  letterSpacing: -0.2,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'A clear photo helps vets identify your pet.',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: greyText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right_rounded,
                          color: greyText,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),

                  // ================================
                  // PET NAME
                  // ================================
                  _label('Pet Name'),
                  const SizedBox(height: 6),
                  _inputField(
                    hint: "Enter pet's name",
                    icon: Icons.pets_outlined,
                  ),
                  const SizedBox(height: 14),

                  // ================================
                  // BREED
                  // ================================
                  _label('Breed'),
                  const SizedBox(height: 6),
                  _inputField(
                    hint: 'e.g., Labrador, Persian Cat',
                    icon: Icons.category_outlined,
                  ),
                  const SizedBox(height: 14),

                  // ================================
                  // AGE
                  // ================================
                  _label('Age'),
                  const SizedBox(height: 6),
                  _inputField(
                    hint: 'e.g., 3 years',
                    icon: Icons.cake_outlined,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 14),

                  // ================================
                  // NOTES
                  // ================================
                  _label('Notes'),
                  const SizedBox(height: 6),
                  _inputField(
                    hint: 'Any special notes about your pet...',
                    icon: Icons.notes_outlined,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 26),

                  // ================================
                  // SAVE BUTTON — bigger, bolder.
                  // ================================
                  SizedBox(
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: teal,
                        foregroundColor: Colors.white,
                        elevation: 8,
                        shadowColor: teal.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_rounded, size: 22),
                          SizedBox(width: 10),
                          Text(
                            'Save Pet',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // =====================================================
  // HELPER: Section label.
  // =====================================================
  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12.5,
        fontWeight: FontWeight.w700,
        color: darkText,
        letterSpacing: -0.2,
      ),
    );
  }

  // =====================================================
  // HELPER: Input field with teal icon.
  // =====================================================
  Widget _inputField({
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: darkText,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: greyText,
          fontSize: 13.5,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 6, right: 8),
          child: Icon(icon, color: teal, size: 20),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 46,
          minHeight: 46,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.05),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: teal, width: 1.5),
        ),
      ),
    );
  }
}