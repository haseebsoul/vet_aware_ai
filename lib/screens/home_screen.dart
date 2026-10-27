import 'package:flutter/material.dart';

// =====================================================
// HOME SCREEN — refined professional design.
// =====================================================
class HomeScreen extends StatelessWidget {
  final VoidCallback? onViewAllPets;

  const HomeScreen({super.key, this.onViewAllPets});
  // Palette.
  static const Color cream = Color(0xFFF7F4EF);
  static const Color darkText = Color(0xFF1A2E28);
  static const Color greyText = Color(0xFF6B7B77);
  static const Color softGrey = Color(0xFF9AABA6);
  static const Color mintDeep = Color(0xFF5FA684);
  static const Color mintLight = Color(0xFFEAF6F0);
  static const Color mintAccent = Color(0xFFC8E8D5);
  static const Color lavender = Color(0xFFF0EBFA);
  static const Color lavenderAccent = Color(0xFFD9C9F0);
  static const Color purpleDeep = Color(0xFF6E56A8);
  static const Color teal = Color(0xFF2BB5A8);
  static const Color amber = Color(0xFFE89B2D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================================
            // TOP NAVBAR — green gradient.
            // =========================================
            Container(
              padding: EdgeInsets.fromLTRB(
                24,
                MediaQuery.of(context).padding.top + 16,
                24,
                24,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF9DD7B5), Color(0xFF7DB89A)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Morning, Haseeb 👋',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "How's the little pal doing today?",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xE6FFFFFF),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                                width: 1,
                              ),
                            ),
                            child: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 10,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: amber,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/user_avatar.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _navStat('5', 'Pets'),
                      _navDivider(),
                      _navStat('4', 'Vaccines'),
                      _navDivider(),
                      _navStat('2', 'Upcoming'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // =========================================
            // SECTION: Your Pet Today
            // =========================================
            _sectionHeader(
              'Your Pet Today',
              'View all',
              onActionTap: onViewAllPets,
            ),
            const SizedBox(height: 12),

            // -----------------------------------------
            // LUNA CARD — refined warm off-white.
            // Mint accent border on the left.
            // -----------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: mintAccent, width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: mintDeep.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Photo + info.
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          // Pet photo with mint ring.
                          Container(
                            width: 64,
                            height: 64,
                            padding: const EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: mintAccent,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/luna_cat.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Luna',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: darkText,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  'Persian Cat · Female · 2 yrs',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: greyText,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // All healthy chip.
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: mintLight,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.verified_rounded,
                                        color: mintDeep,
                                        size: 13,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'All healthy',
                                        style: TextStyle(
                                          fontSize: 10.5,
                                          fontWeight: FontWeight.w800,
                                          color: mintDeep,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Divider.
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      color: mintAccent.withOpacity(0.6),
                    ),

                    // Vaccination progress.
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Vaccination Progress',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w700,
                                  color: darkText,
                                  letterSpacing: -0.1,
                                ),
                              ),
                              Text(
                                '3 / 4 done',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  color: mintDeep,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: 0.75,
                              minHeight: 7,
                              backgroundColor: mintLight,
                              valueColor: const AlwaysStoppedAnimation(
                                mintDeep,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // NEXT appointment card.
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF9EE),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: amber.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: amber.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.vaccines_rounded,
                                color: amber,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'NEXT · BOOSTER VACCINE',
                                    style: TextStyle(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w800,
                                      color: amber,
                                      letterSpacing: 0.4,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '24 Aug · Fri 13:00',
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w800,
                                      color: darkText,
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: darkText,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Remind me',
                                style: TextStyle(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
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
            const SizedBox(height: 28),

            // =========================================
            // SECTION: Recommended Vets
            // =========================================
            _sectionHeader('Recommended Vets', 'See all'),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Vets specialized for Luna',
                style: TextStyle(fontSize: 12, color: greyText),
              ),
            ),
            const SizedBox(height: 12),

            // -----------------------------------------
            // VET CARD — refined lavender.
            // Gradient + better badge + refined text.
            // -----------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: lavenderAccent, width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: purpleDeep.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Doctor row.
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            padding: const EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: lavenderAccent,
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.medical_services_rounded,
                                color: purpleDeep,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Dr. Stephanie Dollores',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: darkText,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Feline Specialist · 10+ yrs',
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    color: greyText,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Rating badge.
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF9EE),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: amber.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star_rounded,
                                  color: amber,
                                  size: 14,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  '4.9',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: darkText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Divider.
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      color: lavenderAccent.withOpacity(0.6),
                    ),

                    // Specialty chips.
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 6,
                          children: [
                            _chip('Vaccines', purpleDeep, lavender),
                            _chip('Nutrition', purpleDeep, lavender),
                            _chip('Behavior', purpleDeep, lavender),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Location + time.
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on_rounded,
                                size: 14,
                                color: greyText,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'VetAware Clinic · 2.3 km',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  color: greyText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: const [
                              Icon(
                                Icons.schedule_rounded,
                                size: 14,
                                color: greyText,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Available Today · 12:00 – 20:00',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  color: greyText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Book button.
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleDeep,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today_rounded, size: 16),
                              SizedBox(width: 8),
                              Text(
                                'Book Appointment',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            // =========================================
            // SECTION: My Pets
            // =========================================
            _sectionHeader('My Pets', 'View all', onActionTap: onViewAllPets),
            const SizedBox(height: 12),

            // PET LIST — horizontal rows.
            // Handles any image size with BoxFit.cover.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _PetRow(
                    image: 'assets/images/bella_dog.jpg',
                    name: 'Bella',
                    breed: 'Labrador',
                    age: '3 yrs',
                    health: 'Healthy',
                    healthColor: Color(0xFF5FA684),
                    onTap: () {
                      Navigator.pushNamed(context, '/pet-profile');
                    },
                  ),
                  const SizedBox(height: 12),
                  _PetRow(
                    image: 'assets/images/luna_cat.jpg',
                    name: 'Luna',
                    breed: 'Persian Cat',
                    age: '2 yrs',
                    health: 'Healthy',
                    healthColor: Color(0xFF5FA684),
                    onTap: () {
                      Navigator.pushNamed(context, '/pet-profile');
                    },
                  ),
                  const SizedBox(height: 12),
                  _PetRow(
                    image: 'assets/images/max_dog.jpg',
                    name: 'Max',
                    breed: 'German Shepherd',
                    age: '5 yrs',
                    health: 'Due soon',
                    healthColor: Color(0xFFE89B2D),
                    onTap: () {
                      Navigator.pushNamed(context, '/pet-profile');
                    },
                  ),
                  const SizedBox(height: 12),
                  _PetRow(
                    image: 'assets/images/coco_parrot.jpg',
                    name: 'Coco',
                    breed: 'Parrot',
                    age: '1 yr',
                    health: 'Due soon',
                    healthColor: Color(0xFFE89B2D),
                    onTap: () {
                      Navigator.pushNamed(context, '/pet-profile');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // Section header.
  // =====================================================
  Widget _sectionHeader(
    String title,
    String action, {
    VoidCallback? onActionTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: darkText,
              letterSpacing: -0.3,
            ),
          ),
          InkWell(
            onTap: onActionTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Text(
                action,
                style: const TextStyle(
                  fontSize: 12,
                  color: teal,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Nav stat inside navbar.
  Widget _navStat(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xCCFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _navDivider() {
    return Container(
      width: 1,
      height: 28,
      color: Colors.white.withOpacity(0.3),
    );
  }

  // Chip for specialties.
  Widget _chip(String label, Color textColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}

// =====================================================
// PET ROW — horizontal card: photo left, info right.
// Handles any image ratio via BoxFit.cover.
// =====================================================
class _PetRow extends StatelessWidget {
  final String image;
  final String name;
  final String breed;
  final String age;
  final String health;
  final Color healthColor;
  final VoidCallback? onTap;

  const _PetRow({
    required this.image,
    required this.name,
    required this.breed,
    required this.age,
    required this.health,
    required this.healthColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
            // -----------------------------------------
            // PHOTO on the LEFT — square + colored ring.
            // BoxFit.cover crops any image to a clean
            // square without distortion.
            // -----------------------------------------
            Container(
              width: 72,
              height: 72,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: healthColor.withOpacity(0.4),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 14),

            // -----------------------------------------
            // INFO in the MIDDLE.
            // -----------------------------------------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Name + health dot next to it.
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1A2E28),
                            letterSpacing: -0.3,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: healthColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Breed · Age.
                  Text(
                    '$breed · $age',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B7B77),
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),

                  // Health status text (small, colored).
                  Text(
                    health,
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      color: healthColor,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),

            // -----------------------------------------
            // CHEVRON on the RIGHT (tap indicator).
            // -----------------------------------------
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFFB5C0BD),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
