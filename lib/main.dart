import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/auth/pages/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage()
    );
  }
}
