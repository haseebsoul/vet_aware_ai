import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

// =====================================================
// PET PROFILE SCREEN — polished, no bugs.
// =====================================================
class PetProfileScreen extends StatelessWidget {
  const PetProfileScreen({super.key});

  // Palette.
  static const Color cream = Color(0xFFF7F4EF);
  static const Color darkText = Color(0xFF1A2E28);
  static const Color greyText = Color(0xFF6B7B77);
  static const Color mintDeep = Color(0xFF5FA684);
  static const Color mintLight = Color(0xFFEAF6F0);
  static const Color amber = Color(0xFFE89B2D);
  static const Color amberLight = Color(0xFFFFF6E8);
  static const Color lavender = Color(0xFFF0EBFA);
  static const Color purpleDeep = Color(0xFF6E56A8);
  static const Color pink = Color(0xFFF8E5E0);
  static const Color pinkDeep = Color(0xFFE05B7A);
  static const Color blueLight = Color(0xFFE4EEF7);
  static const Color blueDeep = Color(0xFF4F7FA8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 140),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =========================================
            // TOP BAR
            // =========================================
            Container(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).padding.top + 12,
                20,
                16,
              ),
              color: cream,
              child: Row(
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
                  const Expanded(
                    child: Text(
                      'Pet Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: darkText,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  // Pet switcher.
                  Container(
                    padding: const EdgeInsets.fromLTRB(6, 6, 12, 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/luna_cat.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Luna',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: darkText,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: darkText,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // =========================================
            // HERO PHOTO — back button overlaid on image.
            // =========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Stack(
                  children: [
                    // Photo.
                    SizedBox(
                      height: 260,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/luna_cat.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Soft dark gradient at bottom.
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.35),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Bottom info on photo.
                    Positioned(
                      left: 20,
                      bottom: 18,
                      right: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Luna',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.5,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54,
                                        blurRadius: 12,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Persian Cat',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w500,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54,
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Edit button on the photo.
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit_outlined,
                              color: darkText,
                              size: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // =========================================
            // INFO CHIPS — Gender · Age · Weight.
            // =========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _infoChip('Gender', 'Female', mintLight, mintDeep),
                  const SizedBox(width: 10),
                  _infoChip('Age', '2 years', lavender, purpleDeep),
                  const SizedBox(width: 10),
                  _infoChip('Weight', '4.2 kg', pink, pinkDeep),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // =========================================
            // MEDICAL HISTORY CARD.
            // =========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header.
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Medical History',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: darkText,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: mintLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                'Up to Date',
                                style: TextStyle(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w800,
                                  color: mintDeep,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.verified_rounded,
                                color: mintDeep,
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Health updates at a glance',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: greyText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Progress.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '2 of 3 vaccines completed',
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: darkText,
                          ),
                        ),
                        Text(
                          '67%',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: mintDeep,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.67,
                        minHeight: 6,
                        backgroundColor: mintLight,
                        valueColor:
                            const AlwaysStoppedAnimation(mintDeep),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Divider.
                    Container(
                      height: 1,
                      color: const Color(0xFFE8E4DD),
                    ),
                    const SizedBox(height: 14),

                    // Finished.
                    const Text(
                      'Finished Vaccines',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _vaccineRow(
                      name: 'Rabies Vaccine',
                      date: '23 Jun 2023',
                      icon: Icons.check_rounded,
                      color: mintDeep,
                      bgColor: mintLight,
                    ),
                    const SizedBox(height: 8),
                    _vaccineRow(
                      name: 'FVRCP Vaccine',
                      date: '12 Jun 2023',
                      icon: Icons.check_rounded,
                      color: mintDeep,
                      bgColor: mintLight,
                    ),
                    const SizedBox(height: 18),

                    // Divider.
                    Container(
                      height: 1,
                      color: const Color(0xFFE8E4DD),
                    ),
                    const SizedBox(height: 14),

                    // Upcoming.
                    const Text(
                      'Upcoming',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // FIX: Booster uses clock icon (not checkmark).
                    _vaccineRow(
                      name: 'Booster Vaccine',
                      date: '24 Aug 2026',
                      icon: Icons.schedule_rounded,
                      color: amber,
                      bgColor: amberLight,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // =========================================
            // PET LIFESTYLE CARD.
            // FIX: width: double.infinity so it stretches.
            // =========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pet Lifestyle',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: darkText,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Fun Quirks & Habits',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: greyText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _lifestyleChip(
                          Icons.nightlight_round,
                          'Nocturnal',
                          lavender,
                          purpleDeep,
                        ),
                        _lifestyleChip(
                          Icons.sentiment_satisfied_alt,
                          'Playful',
                          mintLight,
                          mintDeep,
                        ),
                        _lifestyleChip(
                          Icons.self_improvement,
                          'Calm',
                          blueLight,
                          blueDeep,
                        ),
                        _lifestyleChip(
                          Icons.volume_off_rounded,
                          'Quiet',
                          pink,
                          pinkDeep,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // =========================================
            // OWNER NOTE CARD — fills the empty space.
            // =========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.notes_rounded,
                          color: amber,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Owner Notes',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: darkText,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Luna is very friendly and loves to play with '
                      'feather toys. She is a picky eater — prefers '
                      'wet food over dry. Gets nervous around strangers '
                      'but warms up quickly.',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: greyText,
                        height: 1.6,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(activeIndex: 1),
    );
  }

  // =====================================================
  // HELPER: Info chip.
  // =====================================================
  Widget _infoChip(
    String label,
    String value,
    Color bgColor,
    Color textColor,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: textColor.withOpacity(0.7),
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: textColor,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // HELPER: Vaccine row — FIXED: accepts custom icon.
  // =====================================================
  Widget _vaccineRow({
    required String name,
    required String date,
    required IconData icon,
    required Color color,
    required Color bgColor,
  }) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.vaccines_rounded,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: darkText,
                  letterSpacing: -0.1,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 10.5,
                  color: greyText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,   // ← checkmark for done, clock for upcoming
            color: color,
            size: 14,
          ),
        ),
      ],
    );
  }

  // =====================================================
  // HELPER: Lifestyle chip.
  // =====================================================
  Widget _lifestyleChip(
    IconData icon,
    String label,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w800,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}