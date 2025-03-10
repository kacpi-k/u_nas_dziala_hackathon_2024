import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/helper/navigator/app_navigator.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/button/basic_app_button.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';
import 'package:u_nas_dziala_hackathon_2024/core/constants/image_display_helper.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/auth/pages/login.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/widgets/course_description.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/widgets/course_label.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/widgets/course_widgets_list.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/widgets/speakers_widget.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/pages/home.dart';

class CoursePageSigned extends StatelessWidget {
  final CourseEntity courseEntity;
  const CoursePageSigned({super.key, required this.courseEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(title: Text('Szkolenie')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _courseLabel(courseEntity),
              const SizedBox(height: 40),
              CourseDescription(courseEntity: courseEntity),
              const SizedBox(height: 20),
              const Center(
                  child: Text(
                'Zasoby',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(child: CourseWidgetList()),
              const SizedBox(height: 20),
              const Center(
                  child: Text(
                'Prowadzący',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 20),
              SpeakersWidget(courseEntity: courseEntity),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _enrollButton(context),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _enrollButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          AppNavigator.pushReplacement(context, const HomePage());
        } else {
          AppNavigator.pushReplacement(
              context,
              LoginPage(
                courseEntity: courseEntity,
              ));
        }
      },
      title: 'Zapisz się',
    );
  }

  Widget _courseLabel(CourseEntity courseEntity) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: AppColors.primary,
          border: Border.all(),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Flexible(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(
                            ImageDisplayHelper.generateProductImageURL(
                                courseEntity.img),
                          ),
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16))),
                  ),
                ),
                Flexible(
                  child: _courseDate(courseEntity),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _courseDate(CourseEntity courseEntity) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        '    Termin\n\n${courseEntity.date.toDate().day.toString()}.${courseEntity.date.toDate().month.toString()}.${courseEntity.date.toDate().year}\n     14:00',
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 18,
          color: Colors.black54,
        ),
      ),
    );
  }
}
