import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

// =====================================================
// PET CARE AWARENESS SCREEN — Health Connect style.
// Warm cream bg + orange gradient hero + soft white cards.
// Bottom nav bar at bottom (Learn active).
// =====================================================
class PetCareAwarenessScreen extends StatelessWidget {
  const PetCareAwarenessScreen({super.key});

  // =====================================================
  // LOCAL COLOR PALETTE
  // =====================================================
  static const Color cream = Color(0xFFF5F0EA);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF1F2421);
  static const Color greyText = Color(0xFF7A8781);
  static const Color teal = Color(0xFF2BB5A8);
  static const Color peach = Color(0xFFE89B6F);
  static const Color peachLight = Color(0xFFF4B894);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,

      // -----------------------------------------
      // APP BAR
      // -----------------------------------------
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: darkText),
          onPressed: () {},
        ),
        title: const Text(
          'Pet Care',
          style: TextStyle(
            color: darkText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // -----------------------------------------
      // BODY
      // -----------------------------------------
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // -----------------------------------------
              // HERO BANNER — orange gradient + cat avatar.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [peach, peachLight],
                    ),
                  ),
                  child: Stack(
                    children: [

                      // Decorative white circle top-right.
                      Positioned(
                        top: -40,
                        right: -40,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.15),
                          ),
                        ),
                      ),

                      // Hero content: chip + text + cat avatar.
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // Small pill chip at top.
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                '🐾  Daily Care',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Spacer(),

                            // Row: text left, cat avatar right.
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                // Text block on LEFT.
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Caring for',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Your Pet',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        'Simple daily habits for a healthy, happy pet.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // Cat avatar on RIGHT.
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.7),
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Colors.black.withOpacity(0.15),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/pet_care_hero.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // -----------------------------------------
              // SECTION HEADER: Daily Care Tips
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Daily Care Tips',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 13,
                        color: teal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // -----------------------------------------
              // TIP CARDS
              // -----------------------------------------
              const _TipCard(
                image: 'assets/images/tip_feeding.jpg',
                title: 'Feeding',
                subtitle:
                    'Feed your pet 2 times per day with fresh, balanced '
                    'food. Keep a consistent schedule.',
              ),
              const SizedBox(height: 16),
              const _TipCard(
                image: 'assets/images/tip_hydration.jpg',
                title: 'Hydration',
                subtitle:
                    'Always keep a bowl of clean water available. Change '
                    'it daily to support their kidneys and skin.',
              ),
              const SizedBox(height: 16),
              const _TipCard(
                image: 'assets/images/tip_exercise.jpg',
                title: 'Exercise',
                subtitle:
                    'Play and walk for at least 30 minutes a day. Keeps '
                    'their weight healthy and prevents boredom.',
              ),
              const SizedBox(height: 16),
              const _TipCard(
                image: 'assets/images/tip_vaccine.jpg',
                title: 'Vaccines',
                subtitle:
                    'Keep vaccinations and vet check-ups up to date. A '
                    'quick yearly visit prevents serious diseases.',
              ),
              const SizedBox(height: 28),

              // -----------------------------------------
              // SECTION HEADER: Warning Signs
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Warning Signs',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 13,
                        color: teal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // -----------------------------------------
              // WARNING CARDS
              // -----------------------------------------
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardWhite,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    _WarningItem('Loss of appetite for more than a day'),
                    SizedBox(height: 16),
                    _WarningItem('Unusual lethargy or tiredness'),
                    SizedBox(height: 16),
                    _WarningItem('Vomiting or diarrhea lasting hours'),
                    SizedBox(height: 16),
                    _WarningItem('Difficulty breathing or heavy panting'),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // -----------------------------------------
              // CONTACT VET button
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkText,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Contact Vet',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom nav bar with "Learn" active (index 3).
      bottomNavigationBar: const BottomNavBar(activeIndex: 3),
    );
  }
}

// =====================================================
// TIP CARD — soft white card, image left, text right.
// =====================================================
class _TipCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const _TipCard({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF1F2421);
  static const Color greyText = Color(0xFF7A8781);
  static const Color peach = Color(0xFFE89B6F);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: cardWhite,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [

            // LEFT: Image thumbnail.
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  image,
                  width: 105,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // RIGHT: Title + subtitle.
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 18, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Orange dot + title.
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: peach,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12.5,
                          color: greyText,
                          height: 1.4,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// WARNING ITEM — orange icon box + text.
// =====================================================
class _WarningItem extends StatelessWidget {
  final String text;

  const _WarningItem(this.text);

  static const Color darkText = Color(0xFF1F2421);
  static const Color peach = Color(0xFFE89B6F);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: peach.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.warning_amber_rounded,
            color: peach,
            size: 20,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: darkText,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}