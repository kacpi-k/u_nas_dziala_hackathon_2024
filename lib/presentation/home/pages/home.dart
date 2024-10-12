import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/widgets/category.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/widgets/courses.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/widgets/header.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/widgets/new_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Categories(),
            NewIn(),
            Courses(),
          ],
        ),
      ),
    );
  }
}
