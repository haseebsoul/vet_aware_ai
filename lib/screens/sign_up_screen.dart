import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// =====================================================
// SIGN UP SCREEN — peeking cat banner at top, glass
// panel with registration form below. Light theme.
// Works on both mobile and wide screens.
// =====================================================
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: ConstrainedBox(
              // Limit width on wide screens so it looks nice.
              constraints: const BoxConstraints(maxWidth: 460),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // -----------------------------------------
                  // PEEKING CAT BANNER — top of the screen.
                  // Rounded corners for a soft, friendly look.
                  // -----------------------------------------
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/images/pet_signup.png',
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // -----------------------------------------
                  // GLASS FORM — semi-transparent panel
                  // with the full registration form.
                  // -----------------------------------------
                  _glassForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // =====================================================
  // GLASS FORM — warm white panel with the form.
  // =====================================================
  Widget _glassForm() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        // Subtle blur — barely there.
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            // Warm white at 70% opacity — glass look.
            color: const Color(0xB3FFF9F0),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: const Color(0x99FFFFFF),
              width: 1.2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // -----------------------------------------
              // TITLE + SUBTITLE
              // -----------------------------------------
              const Text(
                'Create Your Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Join VetAware AI — keep your pets healthy.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppTheme.greyText),
              ),
              const SizedBox(height: 24),

              // -----------------------------------------
              // FORM FIELDS — Name, Email, Password,
              // Confirm Password.
              // -----------------------------------------
              _inputField(
                hint: 'Full Name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 14),
              _inputField(
                hint: 'Email',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 14),
              _inputField(
                hint: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 14),
              _inputField(
                hint: 'Confirm Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 20),

              // -----------------------------------------
              // TERMS CHECKBOX (visual only).
              // -----------------------------------------
              Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                    size: 18,
                    color: AppTheme.teal,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'I agree to the Terms & Privacy Policy',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.darkText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // -----------------------------------------
              // SIGN UP BUTTON (solid teal).
              // -----------------------------------------
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
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // -----------------------------------------
              // FOOTER: Already have an account? Log In
              // -----------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.greyText,
                    ),
                  ),
                  Text(
                    'Log In',
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
        fillColor: Colors.white.withOpacity(0.95),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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