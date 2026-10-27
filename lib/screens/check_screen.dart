import 'package:flutter/material.dart';

// =====================================================
// CHECK SCREEN — the core health check feature.
// Step 1: select pet, choose symptoms, add duration.
// Visual only (Assignment 2).
// =====================================================
class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  // Palette.
  static const Color cream = Color(0xFFF7F4EF);
  static const Color darkText = Color(0xFF1A2E28);
  static const Color greyText = Color(0xFF6B7B77);
  static const Color teal = Color(0xFF2BB5A8);
  static const Color mintLight = Color(0xFFEAF6F0);
  static const Color mintDeep = Color(0xFF5FA684);
  static const Color lavender = Color(0xFFF0EBFA);
  static const Color purpleDeep = Color(0xFF6E56A8);
  static const Color amberLight = Color(0xFFFFF6E8);
  static const Color amber = Color(0xFFE89B2D);
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
            // TOP BAR — back + title + Close.
            // =========================================
            Container(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).padding.top + 12,
                20,
                16,
              ),
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
                      'Health Check',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: darkText,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  // Close text.
                  const Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: greyText,
                    ),
                  ),
                ],
              ),
            ),

            // =========================================
            // PROGRESS BAR — step 1 of 3.
            // =========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Step 1 of 3',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: greyText,
                          letterSpacing: 0.3,
                        ),
                      ),
                      Text(
                        '33%',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: purpleDeep,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.33,
                      minHeight: 5,
                      backgroundColor: lavender,
                      valueColor: const AlwaysStoppedAnimation(purpleDeep),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // =========================================
            // PET SELECTOR
            // =========================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Which pet needs a check?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: darkText,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Pet pills (horizontal scroll).
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  _PetSelector(
                    image: 'assets/images/luna_cat.jpg',
                    name: 'Luna',
                    selected: true,
                  ),
                  _PetSelector(
                    image: 'assets/images/bella_dog.jpg',
                    name: 'Bella',
                    selected: false,
                  ),
                  _PetSelector(
                    image: 'assets/images/max_dog.jpg',
                    name: 'Max',
                    selected: false,
                  ),
                  _PetSelector(
                    image: 'assets/images/coco_parrot.jpg',
                    name: 'Coco',
                    selected: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // =========================================
            // SYMPTOM QUESTION
            // =========================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Is Luna experiencing any of these?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: darkText,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Select all that apply',
                style: TextStyle(
                  fontSize: 12,
                  color: greyText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Symptom list.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _symptomRow(
                    icon: Icons.restaurant_rounded,
                    label: 'Stomach upset',
                    sublabel: 'Vomiting, diarrhea, appetite',
                    color: amber,
                    bgColor: amberLight,
                    selected: false,
                  ),
                  const SizedBox(height: 10),
                  _symptomRow(
                    icon: Icons.hearing_rounded,
                    label: 'Ear, eye, or mouth problems',
                    sublabel: 'Discharge, redness, swelling',
                    color: purpleDeep,
                    bgColor: lavender,
                    selected: false,
                  ),
                  const SizedBox(height: 10),
                  _symptomRow(
                    icon: Icons.air_rounded,
                    label: 'Respiratory problems',
                    sublabel: 'Coughing, wheezing, breathing',
                    color: blueDeep,
                    bgColor: blueLight,
                    selected: true, // ← selected example
                  ),
                  const SizedBox(height: 10),
                  _symptomRow(
                    icon: Icons.search_rounded,
                    label: 'Swelling or skin issues',
                    sublabel: 'Rashes, lumps, itching, hair loss',
                    color: pinkDeep,
                    bgColor: pink,
                    selected: false,
                  ),
                  const SizedBox(height: 10),
                  _symptomRow(
                    icon: Icons.help_outline_rounded,
                    label: 'Unexpected behavior',
                    sublabel: 'Lethargy, anxiety, aggression',
                    color: mintDeep,
                    bgColor: mintLight,
                    selected: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // =========================================
            // DURATION QUESTION
            // =========================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'How long has this been happening?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: darkText,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Duration chips.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _durationChip('Today', selected: false),
                  _durationChip('1–3 days', selected: true),
                  _durationChip('1 week', selected: false),
                  _durationChip('2+ weeks', selected: false),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // =========================================
            // PHOTO ATTACH (optional).
            // =========================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Add a photo (optional)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: darkText,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: teal.withOpacity(0.25),
                    width: 1.5,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: mintLight,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        color: mintDeep,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upload a photo',
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                              color: darkText,
                              letterSpacing: -0.2,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Helps the vet understand better',
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
            ),
            const SizedBox(height: 32),

            // =========================================
            // CONTINUE BUTTON.
            // =========================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNavBar(activeIndex: 2),
    );
  }

  // =====================================================
  // HELPER: Pet selector circle.
  // =====================================================

  // =====================================================
  // HELPER: Symptom row (icon + label + optional select).
  // =====================================================
  Widget _symptomRow({
    required IconData icon,
    required String label,
    required String sublabel,
    required Color color,
    required Color bgColor,
    required bool selected,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: selected ? color.withOpacity(0.5) : Colors.transparent,
          width: selected ? 1.5 : 0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon box.
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          // Labels.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  sublabel,
                  style: const TextStyle(
                    fontSize: 11,
                    color: greyText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Checkbox circle.
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? color : Colors.transparent,
              border: Border.all(
                color: selected ? color : const Color(0xFFD5CCC0),
                width: 2,
              ),
            ),
            child: selected
                ? const Icon(Icons.check_rounded, color: Colors.white, size: 14)
                : null,
          ),
        ],
      ),
    );
  }

  // =====================================================
  // HELPER: Duration chip.
  // =====================================================
  Widget _durationChip(String label, {required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? purpleDeep : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected ? purpleDeep : const Color(0xFFE5DDD2),
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.5,
          fontWeight: FontWeight.w700,
          color: selected ? Colors.white : darkText,
        ),
      ),
    );
  }
}

// =====================================================
// PET SELECTOR — top-level widget (needs const constructor
// so it can be used in a const ListView children list).
// =====================================================
class _PetSelector extends StatelessWidget {
  final String image;
  final String name;
  final bool selected;

  const _PetSelector({
    required this.image,
    required this.name,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? const Color(0xFF2BB5A8) : Colors.transparent,
              border: Border.all(
                color: selected ? Colors.transparent : const Color(0xFFE5DDD2),
                width: 2,
              ),
            ),
            child: ClipOval(child: Image.asset(image, fit: BoxFit.cover)),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
              color: selected
                  ? const Color(0xFF1A2E28)
                  : const Color(0xFF6B7B77),
            ),
          ),
        ],
      ),
    );
  }
}
