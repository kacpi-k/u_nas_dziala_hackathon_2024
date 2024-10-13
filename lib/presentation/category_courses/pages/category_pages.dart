import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/course/courses_display_cubit.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/course/courses_display_state.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/course/course_card_column.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/category/entity/category_entity.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/usecases/get_courses_by_category_id.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class CategoryCoursesPage extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryCoursesPage({
    required this.categoryEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) =>
            CoursesDisplayCubit(useCase: sl<GetCoursesByCategoryIdUseCase>())
              ..displayProducts(params: categoryEntity.categoryId),
        child: BlocBuilder<CoursesDisplayCubit, CoursesDisplayState>(
          builder: (context, state) {
            if (state is CoursesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CoursesLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categoryInfo(state.courses),
                    const SizedBox(height: 10),
                    _products(state.courses),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _categoryInfo(List<CourseEntity> products) {
    return Text(
      '${categoryEntity.title} (${products.length})',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _products(List<CourseEntity> products) {
    return Expanded(
      child: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CourseCardColumn(
            courseEntity: products[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
      ),
    );
  }
}
