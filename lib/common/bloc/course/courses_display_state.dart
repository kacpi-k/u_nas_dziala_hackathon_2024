import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';

abstract class CoursesDisplayState {}

class CoursesInitialState extends CoursesDisplayState {}

class CoursesLoading extends CoursesDisplayState {}

class CoursesLoaded extends CoursesDisplayState {
  final List<CourseEntity> courses;
  CoursesLoaded({required this.courses});
}

class LoadCoursesFailure extends CoursesDisplayState {}
