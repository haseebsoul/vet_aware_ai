import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

// =====================================================
// LEARN SCREEN — the "Learn" tab of the app.
// Hero card + categories + featured + articles.
// =====================================================
class PetCareAwarenessScreen extends StatelessWidget {
  const PetCareAwarenessScreen({super.key});

  // Palette.
  static const Color cream = Color(0xFFF7F4EF);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF1F2421);
  static const Color greyText = Color(0xFF7A8781);
  static const Color peach = Color(0xFFE89B6F);
  static const Color peachLight = Color(0xFFF4B894);
  static const Color mint = Color(0xFF5FA684);
  static const Color mintLight = Color(0xFFEAF6F0);
  static const Color lavender = Color(0xFFF0EBFA);
  static const Color purpleDeep = Color(0xFF6E56A8);
  static const Color amber = Color(0xFFE89B2D);
  static const Color amberLight = Color(0xFFFFF6E8);
  static const Color pink = Color(0xFFF8E5E0);
  static const Color pinkDeep = Color(0xFFE05B7A);
  static const Color blueLight = Color(0xFFE4EEF7);
  static const Color blueDeep = Color(0xFF4F7FA8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =========================================
            // TOP BAR
            // =========================================
            Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).padding.top + 12,
                20,
                8,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Learn',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: darkText,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  // Search icon.
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
                      Icons.search_rounded,
                      color: darkText,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            // =========================================
            // HERO — the section you like.
            // =========================================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [peach, peachLight],
                  ),
                ),
                child: Stack(
                  children: [
                    // Decorative circle top-right.
                    Positioned(
                      top: -40,
                      right: -40,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.15),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Chip.
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '🐾  Daily Care',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Spacer(),

                          // Row: text left, cat avatar right.
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'Your Pet',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      'Simple daily habits for a healthy, happy pet.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.5,
                                        height: 1.4,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Cat avatar.
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.8),
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
            const SizedBox(height: 24),

            // =========================================
            // CATEGORY CHIPS — horizontal scroll.
            // =========================================
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  _CategoryChip(label: 'All', selected: true),
                  SizedBox(width: 8),
                  _CategoryChip(label: 'Nutrition', selected: false),
                  SizedBox(width: 8),
                  _CategoryChip(label: 'Health', selected: false),
                  SizedBox(width: 8),
                  _CategoryChip(label: 'Behavior', selected: false),
                  SizedBox(width: 8),
                  _CategoryChip(label: 'Grooming', selected: false),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // =========================================
            // SECTION HEADER: Featured
            // =========================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Featured Article',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: darkText,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // =========================================
            // FEATURED ARTICLE — big card.
            // =========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: cardWhite,
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
                    // Image.
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                      child: Image.asset(
                        'assets/images/tip_feeding.jpg',
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category chip.
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: mintLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'NUTRITION',
                              style: TextStyle(
                                fontSize: 9.5,
                                fontWeight: FontWeight.w800,
                                color: mint,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Complete guide to feeding your pet',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: darkText,
                              letterSpacing: -0.3,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Portion sizes, schedules, and food types '
                            'for different pets.',
                            style: TextStyle(
                              fontSize: 12,
                              color: greyText,
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Meta row.
                          Row(
                            children: const [
                              Icon(
                                Icons.schedule_rounded,
                                size: 12,
                                color: greyText,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '5 min read',
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: greyText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 12),
                              Icon(
                                Icons.visibility_rounded,
                                size: 12,
                                color: greyText,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '2.1k views',
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: greyText,
                                  fontWeight: FontWeight.w600,
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

            // =========================================
            // SECTION HEADER: All Articles
            // =========================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'All Articles',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: darkText,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // =========================================
            // ARTICLE LIST — small rows.
            // =========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  _ArticleRow(
                    image: 'assets/images/tip_hydration.jpg',
                    title: 'Hydration basics for pets',
                    category: 'HEALTH',
                    readTime: '3 min',
                    color: blueDeep,
                    bgColor: blueLight,
                  ),
                  SizedBox(height: 12),
                  _ArticleRow(
                    image: 'assets/images/tip_exercise.jpg',
                    title: 'Daily exercise routines',
                    category: 'BEHAVIOR',
                    readTime: '4 min',
                    color: purpleDeep,
                    bgColor: lavender,
                  ),
                  SizedBox(height: 12),
                  _ArticleRow(
                    image: 'assets/images/tip_vaccine.jpg',
                    title: 'Vaccination schedule',
                    category: 'HEALTH',
                    readTime: '6 min',
                    color: amber,
                    bgColor: amberLight,
                  ),
                  SizedBox(height: 12),
                  _ArticleRow(
                    image: 'assets/images/luna_cat.jpg',
                    title: 'Grooming tips for long-haired cats',
                    category: 'GROOMING',
                    readTime: '5 min',
                    color: pinkDeep,
                    bgColor: pink,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(activeIndex: 3),
    );
  }
}

// =====================================================
// CATEGORY CHIP
// =====================================================
class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _CategoryChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF1F2421) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected
              ? Colors.transparent
              : const Color(0xFFE5DDD2),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: selected ? Colors.white : const Color(0xFF1F2421),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// ARTICLE ROW — small horizontal card.
// =====================================================
class _ArticleRow extends StatelessWidget {
  final String image;
  final String title;
  final String category;
  final String readTime;
  final Color color;
  final Color bgColor;

  const _ArticleRow({
    required this.image,
    required this.title,
    required this.category,
    required this.readTime,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image.
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),

          // Info.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category chip.
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color: color,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                // Title.
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2421),
                    letterSpacing: -0.2,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                // Meta.
                Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: 11,
                      color: const Color(0xFF7A8781),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      readTime,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF7A8781),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Chevron.
          const Icon(
            Icons.chevron_right_rounded,
            color: Color(0xFFB5C0BD),
            size: 22,
          ),
        ],
      ),
    );
  }
}