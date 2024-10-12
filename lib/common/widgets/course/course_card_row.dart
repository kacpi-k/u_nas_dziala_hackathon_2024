import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';
import 'package:u_nas_dziala_hackathon_2024/core/constants/image_display_helper.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';

class CourseCardRow extends StatelessWidget {
  final CourseEntity courseEntity;
  const CourseCardRow({super.key, required this.courseEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO Navigate to CoursePage
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      ImageDisplayHelper.generateProductImageURL(
                          courseEntity.img),
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseEntity.title,
                      style: const TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54),
                    ),
                    Text(
                      courseEntity.speakers[0],
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
