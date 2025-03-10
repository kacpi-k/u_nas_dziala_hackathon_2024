import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_theme.dart';
import 'package:u_nas_dziala_hackathon_2024/firebase_options.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/auth/pages/login.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/chatroom/pages/chatRoom_main.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/pages/attachment_page.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/pages/schedule_page.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/pages/home.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/questionnaire/pages/questionnaire.dart';
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
      home: HomePage(),
    );
  }
}
