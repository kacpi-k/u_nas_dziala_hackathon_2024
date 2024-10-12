import 'package:dartz/dartz.dart';

abstract class CourseService {
  Future<Either> getNewIn();
  Future<Either> getCourses();
}