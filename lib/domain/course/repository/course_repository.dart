import 'package:dartz/dartz.dart';

abstract class CourseRepository {
  Future<Either> getNewIn();
  Future<Either> getCourses();
}