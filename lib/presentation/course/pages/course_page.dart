import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/assets/app_images.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/widgets/course_label.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/widgets/goals_list.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/widgets/speakers_widget.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    List goalsList = ['Goal 1', 'Goal 2', 'Goal 3', 'Goal 4'];
    List speakerList = [
      'Jan Matejko',
      'Adam Mickiewicz',
      'Henryk Sienkiewicz',
      'Marek Towarek'
    ];
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CourseLabel(),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                'Cele szkolenia',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
              GoalsList(goalsList: goalsList),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                'Prowadzący',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 20,),
              SpeakersWidget(speakerList: speakerList),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.primary,
          label: const Text(
            'Zapisz się!',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {}),
    );
  }
}
