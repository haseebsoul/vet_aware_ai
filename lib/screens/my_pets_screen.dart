import 'package:flutter/material.dart';

import '../data/dummy_pets.dart';
import '../widgets/pet_card.dart';

// My Pets screen displays all pets from dummy_pets.dart.
// For Sprint 3, the data is still sample data.
class MyPetsScreen extends StatelessWidget {
  const MyPetsScreen({super.key});

  static const Color cream = Color(0xFFF7F4EF);
  static const Color darkText = Color(0xFF1A2E28);
  static const Color greyText = Color(0xFF6B7B77);
  static const Color teal = Color(0xFF2BB5A8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Screen heading.
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Pets',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: darkText,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'All your little companions in one place.',
                          style: TextStyle(
                            fontSize: 12,
                            color: greyText,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Open the existing Add Pet screen.
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/add-pet');
                    },
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: teal,
                      size: 34,
                    ),
                    tooltip: 'Add a pet',
                  ),
                ],
              ),
            ),

            // Pet list.
            Expanded(
              child: dummyPets.isEmpty
                  ? const Center(
                      child: Text(
                        'No pets added yet.',
                        style: TextStyle(color: greyText),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 24,
                      ),
                      itemCount: dummyPets.length,

                      // Space between cards.
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 4);
                      },

                      itemBuilder: (context, index) {
                        final pet = dummyPets[index];

                        return InkWell(
                          onTap: () {
                            // Open the existing pet profile screen.
                            Navigator.pushNamed(
                              context,
                              '/pet-profile',
                            );
                          },
                          child: PetCard(
                            name: pet.name,
                            breed: pet.breed,
                            age: pet.age,
                            imagePath: pet.imagePath,
                            isVaccinated: pet.isVaccinated,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}