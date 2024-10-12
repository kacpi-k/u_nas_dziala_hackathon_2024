import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/course/courses_display_cubit.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/course/courses_display_state.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/course/course_card_column.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/usecases/get_courses.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoursesDisplayCubit(useCase: GetCoursesUseCase())..displayProducts(),
      child: BlocBuilder<CoursesDisplayCubit, CoursesDisplayState>(
        builder: (context, state) {
          if (state is CoursesLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CoursesLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                _courses(state.courses),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _header() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 40,
        bottom: 20,
      ),
      child: Text(
        'Wszystkie kursy',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _courses(List<CourseEntity> courses) {
    return SizedBox(
      height: 500,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return CourseCardColumn(
            courseEntity: courses[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: courses.length,
      ),
    );
  }
}
