import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/assets/app_images.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    List goalsList = ['Goal 1', 'Goal 2', 'Goal 3'];
    List speakerList = ['Jan Matejko', 'Adam Mickiewicz', 'Henryk Sienkiewicz'];
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: AppColors.niceOrange,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                  AppImages.bussinesPhoto,
                                ),
                                fit: BoxFit.fill),
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Container(
                        height: 200,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nasze cele',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: goalsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(goalsList[index]),
                    subtitle: Text('This is goal ${goalsList[index]}'),
                    trailing: const Icon(Icons.check),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: speakerList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.niceOrange),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                    AppImages.speakerPhoto,
                                  ),
                                  fit: BoxFit.fill),
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Text(speakerList[index])
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        label: const Text(
          'Zapisz się!',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {},
      ),
    );
  }
}
