import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hw_day8/constants/colors.dart';
import 'package:hw_day8/extension/nav.dart';
import 'package:hw_day8/screens/data_screen.dart';
import 'package:hw_day8/screens/login_screen.dart';
import 'package:hw_day8/service/api.dart';
import 'package:hw_day8/widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.latte,
        title: Text(
          "sign Up ",
          style:  GoogleFonts.poppins(
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
            TextFieldWidget(
              hint: "Enter you Email",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.mocha,
              ),
              icon: Icon(Icons.email),
              controller: emailController,
            ),
            SizedBox(height: 24),
            TextFieldWidget(
              hint: "Enter you Password",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.mocha,
              ),
              icon: Icon(Icons.password),
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
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Api().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  await Api().login(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

                  if (context.mounted) {
                    context.pushAndClear(ProductScreen());
                  }
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Text("Sign up",style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.latte,
                shadows: [
                  Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    color: AppColors.mocha.withOpacity(0.5),
                  ),
                ],
              )),
            ),
            TextButton(
              onPressed: () {
                context.pushAndClear(LoginScreen());
              },
              child: Text("already have an account? login",
                  style: GoogleFonts.poppins(
                    color: AppColors.mocha,
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        blurRadius: 2,
                        color: AppColors.mocha.withOpacity(0.5),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
