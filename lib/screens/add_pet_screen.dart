import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

// =====================================================
// ADD PET SCREEN — cream theme, matching the dashboard.
// Form to add a new pet (visual only, no functionality).
// Has a bottom nav bar at the bottom.
// =====================================================
class AddPetScreen extends StatelessWidget {
  const AddPetScreen({super.key});

  // Local color palette — cream, warm.
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
              // TOP BAR — back arrow + title.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: cardWhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: darkText,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Add New Pet',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // -----------------------------------------
              // PHOTO PICKER — teal box, centered.
              // -----------------------------------------
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: teal,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: teal.withOpacity(0.3),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                            size: 32,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Add Photo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Upload a clear photo of your pet',
                      style: TextStyle(fontSize: 12, color: greyText),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // -----------------------------------------
              // FORM SECTION — Basic Info card.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardWhite,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section header with icon.
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: teal.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.pets_rounded,
                              color: teal,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Basic Info',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: darkText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Pet Name field.
                      _label('Pet Name'),
                      const SizedBox(height: 6),
                      _inputField(hint: "Enter pet's name"),
                      const SizedBox(height: 16),

                      // Breed field.
                      _label('Breed'),
                      const SizedBox(height: 6),
                      _inputField(hint: 'e.g., Labrador, Persian Cat'),
                      const SizedBox(height: 16),

                      // Age field.
                      _label('Age'),
                      const SizedBox(height: 6),
                      _inputField(
                        hint: 'e.g., 3 years',
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // -----------------------------------------
              // FORM SECTION — Notes card.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardWhite,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section header with icon.
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: peach.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.notes_rounded,
                              color: peach,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Notes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: darkText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Notes field (multiline).
                      _inputField(
                        hint: 'Any special notes about your pet...',
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // -----------------------------------------
              // SAVE PET button.
              // -----------------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 56,
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
                      'Save Pet',
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

      // Bottom nav bar with "Pets" active (index 1).
      bottomNavigationBar: const BottomNavBar(activeIndex: 1),
    );
  }

  // =====================================================
  // HELPER: Section label above a field.
  // =====================================================
  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: darkText,
      ),
    );
  }

  // =====================================================
  // HELPER: Cream-themed input field.
  // =====================================================
  Widget _inputField({
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: darkText),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: greyText, fontSize: 14),
        filled: true,
        fillColor: cream,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: teal, width: 1.5),
        ),
      ),
    );
  }
}