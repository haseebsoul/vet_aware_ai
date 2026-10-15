// Brings in the basic Flutter widgets.
import 'package:flutter/material.dart';
// Brings in our colors and theme.
import 'theme/app_theme.dart';
// Brings in our PetCard cookie cutter.
import 'widgets/pet_card.dart';

// The front door of the app. Flutter starts here.
void main() {
  // runApp() tells Flutter to start drawing our app.
  runApp(const VetAwareApp());
}

// This is the whole app shell.
class VetAwareApp extends StatelessWidget {
  // Constructor for the app widget.
  const VetAwareApp({super.key});

  // build() tells Flutter what to draw.
  @override
  Widget build(BuildContext context) {
    // MaterialApp holds the app name, theme, and first screen.
    return MaterialApp(
      // The name of our app.
      title: 'VetAware AI',
      // Hides the red DEBUG banner in the corner.
      debugShowCheckedModeBanner: false,
      // Uses the colors we saved in app_theme.dart.
      theme: AppTheme.lightTheme,
      // Scaffold is the skeleton of one page.
      home: Scaffold(
        // The teal bar at the top.
        appBar: AppBar(title: const Text('VetAware AI')),
        // ListView is a list that scrolls when it gets too long.
        body: ListView(
          // The four cards, each with different pet details.
          children: const [
            // First stamp of the cookie cutter.
            PetCard(name: 'Bella', breed: 'Labrador', age: 3, isVaccinated: true),
            // Second stamp with different details.
            PetCard(name: 'Luna', breed: 'Persian Cat', age: 2, isVaccinated: true),
            // Third stamp.
            PetCard(name: 'Max', breed: 'German Shepherd', age: 5, isVaccinated: false),
            // Fourth stamp.
            PetCard(name: 'Coco', breed: 'Parrot', age: 1, isVaccinated: false),
          ],
        ),
      ),
    );
  }
}