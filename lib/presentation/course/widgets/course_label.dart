import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/assets/app_images.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';

class CourseLabel extends StatelessWidget {
  const CourseLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: AppColors.primary,
          border: Border.all(),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Flexible(
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            AppImages.bussinesPhoto,
                          ),
                          fit: BoxFit.fill),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30)),
                ),
                Flexible(
                  child: Container(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text('Oto krótki opis szkolenia, zawiera proste i zrozumiałe informacje na temat zakresu kursu', style: TextStyle(color: Colors.black54),)
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
