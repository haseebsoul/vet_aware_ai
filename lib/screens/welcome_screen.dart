import 'dart:ui';
import 'package:flutter/material.dart';

// =====================================================
// WELCOME SCREEN — mind-blowing editorial design.
// Glass logo pill + warm glow + floating paw prints.
// =====================================================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // Palette.
  static const Color cream = Color(0xFFF5F0EA);
  static const Color darkText = Color(0xFF1F2421);
  static const Color teal = Color(0xFF2BB5A8);
  static const Color peach = Color(0xFFE89B6F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Stack(
              fit: StackFit.expand,
              children: [

                // -----------------------------------------
                // LAYER 1: Dog image.
                // -----------------------------------------
                Image.asset(
                  'assets/images/welcome_bg.jpg',
                  fit: BoxFit.cover,
                ),

                // -----------------------------------------
                // LAYER 2: Gradient (darker top + bottom).
                // -----------------------------------------
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x99000000),
                        Color(0x22000000),
                        Color(0xAA000000),
                        Color(0xF0000000),
                      ],
                      stops: [0.0, 0.35, 0.72, 1.0],
                    ),
                  ),
                ),

                // -----------------------------------------
                // LAYER 3: WARM RADIAL GLOW behind headline.
                // Soft peach halo — feels like golden hour.
                // -----------------------------------------
                Positioned(
                  bottom: 60,
                  left: -80,
                  right: -80,
                  height: 500,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          peach.withOpacity(0.35),
                          peach.withOpacity(0.1),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),

                // -----------------------------------------
                // LAYER 4: FLOATING PAW PRINTS (decorative).
                // Very subtle — adds texture without noise.
                // -----------------------------------------
                Positioned(
                  top: 140,
                  left: 30,
                  child: _pawPrint(0.12, 22, -0.3),
                ),
                Positioned(
                  top: 230,
                  right: 40,
                  child: _pawPrint(0.09, 18, 0.4),
                ),
                Positioned(
                  top: 340,
                  left: 55,
                  child: _pawPrint(0.07, 14, 0.15),
                ),
                Positioned(
                  bottom: 380,
                  right: 60,
                  child: _pawPrint(0.08, 16, -0.2),
                ),

                // -----------------------------------------
                // LAYER 5: Content.
                // -----------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // -----------------------------------------
                      // TOP BAR: Glass logo pill + Sign Up pill.
                      // -----------------------------------------
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [

                          // GLASS LOGO PILL.
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 12,
                                sigmaY: 12,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.25),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Teal circle with paw.
                                    Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        color: teal,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: teal.withOpacity(0.5),
                                            blurRadius: 12,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.pets,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'VetAware',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // SIGN UP PILL (peach-tinted).
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: peach.withOpacity(0.4),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: teal,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: darkText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // -----------------------------------------
                      // HEADLINE — pills with soft shadow.
                      // -----------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Caring for ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                              height: 1.15,
                              letterSpacing: -0.5,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  blurRadius: 16,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          _pillWord('pets'),
                        ],
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'not just ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                              height: 1.15,
                              letterSpacing: -0.5,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  blurRadius: 16,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          _pillWord('apps'),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // -----------------------------------------
                      // SUBTITLE.
                      // -----------------------------------------
                      const Text(
                        'Track vaccines, learn daily care tips,\n'
                        'and prepare for vet visits — all in\n'
                        'one calm, loving app.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.55,
                          fontWeight: FontWeight.w400,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              blurRadius: 8,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // -----------------------------------------
                      // BOTTOM: White pill "Get Started" button.
                      // -----------------------------------------
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                            // Warm glow under the button.
                            BoxShadow(
                              color: peach.withOpacity(0.3),
                              blurRadius: 30,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get Started',
                              style: TextStyle(
                                color: darkText,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.2,
                              ),
                            ),
                            SizedBox(width: 10),
                            // Arrow inside teal circle.
                            _ArrowBadge(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =====================================================
  // HELPER: A word wrapped in a soft white pill.
  // =====================================================
  Widget _pillWord(String word) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        word,
        style: const TextStyle(
          color: darkText,
          fontSize: 30,
          fontWeight: FontWeight.w800,
          height: 1.1,
          letterSpacing: -0.6,
        ),
      ),
    );
  }

  // =====================================================
  // HELPER: Floating decorative paw print.
  // Very low opacity for texture.
  // =====================================================
  Widget _pawPrint(double opacity, double size, double rotation) {
    return Transform.rotate(
      angle: rotation,
      child: Icon(
        Icons.pets,
        color: Colors.white.withOpacity(opacity),
        size: size,
      ),
    );
  }
}

// =====================================================
// ARROW BADGE — small teal circle with white arrow.
// Used inside the Get Started button.
// =====================================================
class _ArrowBadge extends StatelessWidget {
  const _ArrowBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: Color(0xFF2BB5A8),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.arrow_forward_rounded,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}