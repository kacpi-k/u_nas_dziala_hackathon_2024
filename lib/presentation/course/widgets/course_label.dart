import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/assets/app_images.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';
import 'package:u_nas_dziala_hackathon_2024/core/constants/image_display_helper.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';

class CourseLabel extends StatelessWidget {
  final CourseEntity courseEntity;
  const CourseLabel({
    super.key,
    required this.courseEntity,
  });

  @override
  Widget build(BuildContext context) {
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
                  child: _coursePrice(courseEntity),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _coursePrice(CourseEntity courseEntity) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        courseEntity.price != 0
            ? 'Cena: ${courseEntity.price.toString()}zł'
            : 'Bezpłatne',
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 24,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _courseDescription(CourseEntity courseEntity) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        courseEntity.description,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    );
  }
}
