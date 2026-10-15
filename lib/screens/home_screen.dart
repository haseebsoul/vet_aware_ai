import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

// =====================================================
// HOME SCREEN — Dashboard style.
// Greeting + search + featured pet + stats + actions
// + pet grid (2-column) + bottom nav.
// =====================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Local color palette — cream, warm, premium.
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
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // -----------------------------------------
              // TOP: greeting + avatar.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Good Morning 👋',
                          style: TextStyle(fontSize: 13, color: greyText),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Sarah Johnson',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: teal.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        color: teal,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // -----------------------------------------
              // SEARCH BAR
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: cardWhite,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search_rounded, color: greyText, size: 22),
                      SizedBox(width: 10),
                      Text(
                        'Search pets, tips, vets...',
                        style: TextStyle(color: greyText, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // -----------------------------------------
              // FEATURED PET CARD — text left, image right.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [peach, Color(0xFFF4B894)],
                    ),
                  ),
                  child: Row(
                    children: [

                      // Text on the LEFT.
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Your Pet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Luna',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Persian Cat · 2 yrs',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'View Profile  →',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Image on the RIGHT.
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        child: Image.asset(
                          'assets/images/luna_cat.jpg',
                          width: 140,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // -----------------------------------------
              // STATS ROW — 3 small cards.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: const [
                    Expanded(
                      child: _StatBox(
                        icon: Icons.pets_rounded,
                        value: '5',
                        label: 'Pets',
                        color: teal,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _StatBox(
                        icon: Icons.vaccines_rounded,
                        value: '4',
                        label: 'Vaccines',
                        color: peach,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _StatBox(
                        icon: Icons.event_available_rounded,
                        value: '2',
                        label: 'Visits',
                        color: Color(0xFF7FB5D8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // -----------------------------------------
              // QUICK ACTIONS header
              // -----------------------------------------
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Quick Actions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // -----------------------------------------
              // QUICK ACTIONS grid — 4 buttons.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: const [
                    Expanded(
                      child: _QuickAction(
                        icon: Icons.add_circle_outline_rounded,
                        label: 'Add Pet',
                        color: teal,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _QuickAction(
                        icon: Icons.calendar_today_rounded,
                        label: 'Book Vet',
                        color: peach,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _QuickAction(
                        icon: Icons.folder_rounded,
                        label: 'Records',
                        color: Color(0xFF7FB5D8),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _QuickAction(
                        icon: Icons.menu_book_rounded,
                        label: 'Learn',
                        color: Color(0xFFB69BDB),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // -----------------------------------------
              // MY PETS header
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'My Pets',
                      style: TextStyle(
                        fontSize: 18,
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
              // MY PETS — 2-column grid with all 5 pets.
              // GridView.count shrinkWrap fits inside scroll.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                  children: const [
                    _PetGridCard(
                      image: 'assets/images/bella_dog.jpg',
                      name: 'Bella',
                      breed: 'Labrador',
                      age: '3 yrs',
                      isVaccinated: true,
                    ),
                    _PetGridCard(
                      image: 'assets/images/luna_cat.jpg',
                      name: 'Luna',
                      breed: 'Persian Cat',
                      age: '2 yrs',
                      isVaccinated: true,
                    ),
                    _PetGridCard(
                      image: 'assets/images/max_dog.jpg',
                      name: 'Max',
                      breed: 'German Shepherd',
                      age: '5 yrs',
                      isVaccinated: false,
                    ),
                    _PetGridCard(
                      image: 'assets/images/coco_parrot.jpg',
                      name: 'Coco',
                      breed: 'Parrot',
                      age: '1 yr',
                      isVaccinated: false,
                    ),
                    _PetGridCard(
                      image: 'assets/images/max_dog.jpg',
                      name: 'Rocky',
                      breed: 'Bulldog',
                      age: '4 yrs',
                      isVaccinated: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom nav bar with Home active.
      bottomNavigationBar: const BottomNavBar(activeIndex: 0),
    );
  }
}

// =====================================================
// STAT BOX
// =====================================================
class _StatBox extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatBox({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
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
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2421),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF7A8781),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// QUICK ACTION
// =====================================================
class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(icon, color: color, size: 26),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2421),
          ),
        ),
      ],
    );
  }
}

// =====================================================
// PET GRID CARD — big card with photo, name, breed,
// age, and vaccine badge. Used in 2-column grid.
// =====================================================
class _PetGridCard extends StatelessWidget {
  final String image;
  final String name;
  final String breed;
  final String age;
  final bool isVaccinated;

  const _PetGridCard({
    required this.image,
    required this.name,
    required this.breed,
    required this.age,
    required this.isVaccinated,
  });

  static const Color darkText = Color(0xFF1F2421);
  static const Color greyText = Color(0xFF7A8781);
  static const Color teal = Color(0xFF2BB5A8);
  static const Color peach = Color(0xFFE89B6F);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // -----------------------------------------
          // IMAGE — fills the top area, cropped nicely.
          // Expanded uses all remaining vertical space.
          // -----------------------------------------
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [

                  // Pet photo.
                  Image.asset(image, fit: BoxFit.cover),

                  // Vaccine badge (top-right).
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isVaccinated
                            ? Icons.verified_rounded
                            : Icons.warning_amber_rounded,
                        size: 16,
                        color: isVaccinated ? teal : peach,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // -----------------------------------------
          // TEXT — name, breed, age.
          // -----------------------------------------
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  breed,
                  style: const TextStyle(
                    fontSize: 11,
                    color: greyText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  age,
                  style: const TextStyle(
                    fontSize: 11,
                    color: teal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}