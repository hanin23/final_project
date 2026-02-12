import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hw_day8/constants/colors.dart';
import 'package:hw_day8/extension/nav.dart';
import 'package:hw_day8/screens/data_screen.dart';
import 'package:hw_day8/screens/sign_up_screen.dart';
import 'package:hw_day8/service/api.dart';
import 'package:hw_day8/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.latte,
        title: Text(
          "Login",
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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 100),
        child: Column(
          children: [
            // Email
            TextFieldWidget(
              hint: "Enter your Email",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.mocha,
              ),
              icon: const Icon(Icons.email),
              controller: emailController,
            ),

            const SizedBox(height: 24),

            // Password
            TextFieldWidget(
              hint: "Enter your Password",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.mocha,
              ),
              icon: const Icon(Icons.lock),
              controller: passwordController,
              obscureText: hidden,
              suffixIcon: IconButton(
                icon: Icon(
                  hidden
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.mocha,
                ),
                onPressed: () {
                  setState(() {
                    hidden = !hidden;
                  });
                },
              ),
            ),

            const SizedBox(height: 24),

            // Login Button
            ElevatedButton(
              onPressed: () async {
                try {
                  await Api().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (context.mounted) {
                    context.push(ProductScreen());
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              child: Text(
                "Login",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: AppColors.latte,
                  shadows: [
                    Shadow(
                      offset: const Offset(1, 1),
                      blurRadius: 2,
                      color: AppColors.mocha.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),

            // Sign up
            TextButton(
              onPressed: () {
                context.pushAndClear(const SignUpScreen());
              },
              child: Text(
                "Don't have an account? Sign up",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.mocha,
                  shadows: [
                    Shadow(
                      offset: const Offset(1, 1),
                      blurRadius: 2,
                      color: AppColors.mocha.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
