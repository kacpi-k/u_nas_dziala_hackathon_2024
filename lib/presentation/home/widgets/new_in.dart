import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/course/courses_display_cubit.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/course/courses_display_state.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/course/course_card_row.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/usecases/get_new_in.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoursesDisplayCubit(useCase: GetNewInUseCase())..displayProducts(),
      child: BlocBuilder<CoursesDisplayCubit, CoursesDisplayState>(
        builder: (context, state) {
          if (state is CoursesLoading) {
            log("loading");
            return const CircularProgressIndicator();
          }
          if (state is CoursesLoaded) {
            log('loaded');
            log('Liczba kursów: ${state.courses.length}');
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _newIn(),
                _courses(state.courses),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _newIn() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 40,
        bottom: 20,
      ),
      child: Text(
        'Ostatnio dodane kursy',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _courses(List<CourseEntity> courses) {
    log('w _courses');
    return SizedBox(
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CourseCardRow(
            courseEntity: courses[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: courses.length,
      ),
    );
  }
}
