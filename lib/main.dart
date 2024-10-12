import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_theme.dart';
import 'package:u_nas_dziala_hackathon_2024/firebase_options.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/pages/home.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependecies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const HomePage(),
    );
  }
}
