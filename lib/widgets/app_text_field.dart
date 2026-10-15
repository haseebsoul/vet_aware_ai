import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// AppTextField = our reusable dark input box with an icon.
class AppTextField extends StatelessWidget {
  final String hint;     // grey helper text, like "Email"
  final IconData icon;   // icon shown on the left
  final bool isPassword; // true = hide the typed letters

  const AppTextField({
    super.key,
    required this.hint,
    required this.icon,
    // Optional parameter: if you skip it, it defaults to false
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    // Padding adds the gap below each field
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        // obscureText turns letters into dots
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          // filled + fillColor = solid dark background
          filled: true,
          fillColor: AppTheme.surface,
          // Rounded corners with no outline
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}