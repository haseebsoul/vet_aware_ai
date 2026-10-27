import 'dart:ui';
import 'package:flutter/material.dart';

// =====================================================
// WELCOME SCREEN — glass logo + Welcome title + big image.
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

                // LAYER 1: Pet image.
                Image.asset(
                  'assets/images/welcome_bg.jpg',
                  fit: BoxFit.cover,
                ),

                // LAYER 2: Gradient.
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

                // LAYER 3: Warm glow behind headline.
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

                // LAYER 4: Floating paw prints.
                Positioned(
                  top: 220,
                  left: 30,
                  child: _pawPrint(0.12, 22, -0.3),
                ),
                Positioned(
                  top: 320,
                  right: 40,
                  child: _pawPrint(0.09, 18, 0.4),
                ),
                Positioned(
                  top: 420,
                  left: 55,
                  child: _pawPrint(0.07, 14, 0.15),
                ),

                // LAYER 5: Content.
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // -----------------------------------------
                      // TOP BAR: Glass logo only.
                      // -----------------------------------------
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 14,
                            sigmaY: 14,
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(
                              8, 7, 14, 7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.18),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Teal paw circle with glow.
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: teal,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: teal.withOpacity(0.7),
                                        blurRadius: 16,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.pets,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'VetAware',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // -----------------------------------------
                      // WELCOME TITLE — bold, white, big.
                      // -----------------------------------------
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          height: 1.15,
                          letterSpacing: -0.5,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              blurRadius: 16,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'VetAware',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                          letterSpacing: -1,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              blurRadius: 16,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // -----------------------------------------
                      // HEADLINE — pills.
                      // -----------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Caring for ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
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
                              fontSize: 32,
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
                      const SizedBox(height: 22),

                      // SUBTITLE.
                      const Text(
                        'Track vaccines, learn daily care tips,\n'
                        'and prepare for vet visits.',
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
                      const SizedBox(height: 28),

                      // -----------------------------------------
                      // GET STARTED button.
                      // -----------------------------------------
                      // 👉 [ROUTING] Wrapping in GestureDetector makes the Container tappable.
                      GestureDetector(
                        // 👉 [ROUTING] Tapping this opens the Login screen ('/login').
                        onTap: () => Navigator.pushNamed(context, '/login'),
                        
                        child: Container(
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
                              _ArrowBadge(),
                            ],
                          ),
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
  // HELPER: Word inside white pill.
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
          fontSize: 28,
          fontWeight: FontWeight.w800,
          height: 1.1,
          letterSpacing: -0.6,
        ),
      ),
    );
  }

  // =====================================================
  // HELPER: Floating paw print.
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
// ARROW BADGE — teal circle with white arrow.
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