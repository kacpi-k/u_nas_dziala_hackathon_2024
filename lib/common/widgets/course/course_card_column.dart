import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';
import 'package:u_nas_dziala_hackathon_2024/core/constants/image_display_helper.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';

class CourseCardColumn extends StatelessWidget {
  final CourseEntity courseEntity;
  const CourseCardColumn({super.key, required this.courseEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO Navigate to CoursePage
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
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
                    bottomLeft: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseEntity.title,
                      style: const TextStyle(
                          fontSize: 14,
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
                    const SizedBox(height: 10),
                    Text(
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      courseEntity.description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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
