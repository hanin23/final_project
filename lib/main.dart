import 'package:flutter/material.dart';
import 'package:hw_day8/screens/login_screen.dart';
import 'package:hw_day8/screens/welcom_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://aeqkotsxmmuocrkalmwy.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFlcWtvdHN4bW11b2Nya2FsbXd5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk2MDUxNzQsImV4cCI6MjA4NTE4MTE3NH0.8ojBMas4E3x1yg-cjpwY_SMH3YeTuTp-4qokI9ItYpg",
  );

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
