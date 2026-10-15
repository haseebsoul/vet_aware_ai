import 'package:flutter/material.dart';

// AppButton = our reusable white pill button.
// Write it once, use it on every screen.
class AppButton extends StatelessWidget {
  // The text shown inside the button
  final String label;

  const AppButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Empty function = the button does nothing yet (Assignment 2 is visual only)
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // double.infinity = as wide as the screen allows
        minimumSize: const Size(double.infinity, 56),
        // StadiumBorder = fully rounded pill shape
        shape: const StadiumBorder(),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}