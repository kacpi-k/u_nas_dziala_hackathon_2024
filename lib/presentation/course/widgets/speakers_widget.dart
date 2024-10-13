import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/assets/app_images.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';

class SpeakersWidget extends StatelessWidget {
  final CourseEntity courseEntity;
  const SpeakersWidget({
    super.key,
    required this.courseEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: courseEntity.speakers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: 110,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          AppImages.speakerPhoto,
                        ),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                height: 50,
                width: 110,
                decoration: const BoxDecoration(
                  //border: Border.all(),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight:
                          Radius.circular(10)), /*color: AppColors.primary*/
                ),
                alignment: Alignment.center,
                child: Text(
                  courseEntity.speakers[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
