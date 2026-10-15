import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

// =====================================================
// LOGIN SCREEN — full dog image + Continue button.
// Tapping Continue opens a modal bottom sheet with
// the actual login form (progressive disclosure).
// =====================================================
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // -----------------------------------------
          // LAYER 1: DOG IMAGE — full screen background.
          // Scale 1.3 zooms it in so it fills beautifully.
          // -----------------------------------------
          Positioned.fill(
            child: Transform.scale(
              scale: 1.3,
              child: Image.asset(
                'assets/images/pet_login.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // -----------------------------------------
          // LAYER 2: CONTINUE BUTTON — floating at
          // the bottom of the screen.
          // Tapping it opens the login sheet.
          // -----------------------------------------
          Positioned(
            left: 24,
            right: 24,
            bottom: 40,
            child: SafeArea(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () => _openLoginSheet(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.teal,
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // Opens the modal bottom sheet with the login form.
  // showModalBottomSheet = Flutter built-in sheet.
  // =====================================================
  void _openLoginSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // allows taller sheet
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) => const _LoginSheet(),
    );
  }
}

// =====================================================
// LOGIN SHEET — the content inside the bottom sheet.
// Glass panel look with the full login form.
// =====================================================
class _LoginSheet extends StatelessWidget {
  const _LoginSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            padding: const EdgeInsets.fromLTRB(28, 12, 28, 32),
            decoration: const BoxDecoration(
              // Warm white at 85% opacity — readable glass.
              color: Color(0xD9FFF9F0),
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Drag handle bar at the top.
                Center(
                  child: Container(
                    width: 44,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // Title + subtitle.
                const Text(
                  'Welcome!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Sign in or Sign up to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: AppTheme.greyText),
                ),
                const SizedBox(height: 24),

                // Social buttons row (Google, Facebook, Apple).
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(icon: Icons.g_mobiledata),
                    const SizedBox(width: 16),
                    _socialButton(
                      icon: Icons.facebook,
                      color: const Color(0xFF1877F2),
                    ),
                    const SizedBox(width: 16),
                    _socialButton(icon: Icons.apple),
                  ],
                ),
                const SizedBox(height: 24),

                // Divider with "Or continue with email".
                Row(
                  children: const [
                    Expanded(child: Divider(color: AppTheme.lightBorder)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Or continue with email',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.greyText,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: AppTheme.lightBorder)),
                  ],
                ),
                const SizedBox(height: 20),

                // Email + Password input fields.
                _inputField(hint: 'Email', icon: Icons.email_outlined),
                const SizedBox(height: 14),
                _inputField(
                  hint: 'Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                // Sign In button.
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.teal,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Footer: Don't have an account? Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 13, color: AppTheme.greyText),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =====================================================
  // HELPER: Round social button (Google/Facebook/Apple).
  // =====================================================
  Widget _socialButton({
    required IconData icon,
    Color color = AppTheme.darkText,
  }) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 26),
    );
  }

  // =====================================================
  // HELPER: Rounded white input field.
  // =====================================================
  Widget _inputField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14, color: AppTheme.greyText),
        prefixIcon: Icon(icon, color: AppTheme.greyText, size: 20),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
