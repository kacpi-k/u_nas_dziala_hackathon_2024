import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';

class CourseDescription extends StatelessWidget {
  final CourseEntity courseEntity;
  const CourseDescription({super.key, required this.courseEntity});

  @override
  Widget build(BuildContext context) {
    return Text(
      courseEntity.description,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
