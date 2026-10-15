import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// PetCard = our cookie cutter. One design, many pets.
class PetCard extends StatelessWidget {
  // The details every card needs. "final" = set once, never changed.
  final String name;
  final String breed;
  final int age;
  final String imagePath;
  final bool isVaccinated;

  // Constructor = the order form. "required" means you must fill it in.
  const PetCard({
    super.key,
    required this.name,
    required this.breed,
    required this.age,
    required this.imagePath,
    required this.isVaccinated,
  });

  @override
  Widget build(BuildContext context) {
    // ===== CARD: dark rounded box =====
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),

      // ===== ROW: photo | text | heart =====
      child: Row(
        children: [
          // --- Left: pet photo with rounded corners ---
          // ClipRRect cuts the picture into a rounded shape
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            // BoxFit.cover fills the box without stretching the photo
            child: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 14),

          // --- Middle: name, details, vaccination badge ---
          // Expanded = take all the leftover space
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                // $breed and $age put the real values inside the sentence
                Text(
                  '$breed  •  $age ${age == 1 ? 'year' : 'years'}',
                  style: const TextStyle(color: AppTheme.softText),
                ),
                const SizedBox(height: 8),

                // Badge: icon and label change with isVaccinated
                Row(
                  children: [
                    Icon(
                      isVaccinated ? Icons.verified : Icons.warning_amber,
                      size: 16,
                      color: isVaccinated ? AppTheme.teal : Colors.orange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isVaccinated ? 'Vaccinated' : 'Not vaccinated',
                      style: TextStyle(
                        fontSize: 12,
                        color: isVaccinated ? AppTheme.teal : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // --- Right: heart icon ---
          const Icon(Icons.favorite_border, color: AppTheme.softText),
        ],
      ),
    );
  }
}