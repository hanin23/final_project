import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hw_day8/constants/colors.dart';
import 'package:hw_day8/extension/nav.dart';
import 'package:hw_day8/widgets/feature_item_widget.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              AppColors.mocha.withOpacity(0.8),
              AppColors.latte,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.white, size: 28),

            const SizedBox(height: 24),

        Text(
              "Welcome!",
              style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
            shadows: [
              Shadow(
                offset: const Offset(1, 1),
                blurRadius: 2,
                color: AppColors.mocha.withOpacity(0.5),
              ),
            ],
          ),
        ),

            const SizedBox(height: 12),

            Text(
              "Your shopping journey starts here",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 40),

            FeatureItem(icon: Icons.shopping_bag, text: "Easy shopping experience"),
            FeatureItem(icon: Icons.favorite, text: "Quality products, great prices"),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                context.push(const LoginScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Next",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mocha,
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Icon(Icons.star, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }
}
