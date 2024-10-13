import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/data/course/models/course.dart';
import 'package:u_nas_dziala_hackathon_2024/data/course/source/course_service.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/repository/course_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class CourseRepositoryImpl extends CourseRepository {
  @override
  Future<Either> getNewIn() async {
    var returnedData = await sl<CourseService>().getNewIn();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => CourseModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> getCourses() async {
    var returnedData = await sl<CourseService>().getCourses();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => CourseModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> getCoursesByCategoryId(String categoryId) async {
    var returnedData =
        await sl<CourseService>().getCoursesByCategoryId(categoryId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => CourseModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> enrollForCourse(
      String userId, String courseId) async {
    var returnedData =
        await sl<CourseService>().enrollForCourse(userId, courseId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => CourseModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }
}
