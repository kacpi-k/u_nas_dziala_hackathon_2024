import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/data/course/source/course_service.dart';

class CourseFirebaseService extends CourseService {
  @override
  Future<Either> getNewIn() async {
    DateTime now = DateTime.now();
    DateTime oneMonthAgo = DateTime(now.year, now.month - 1, now.day);

    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Courses')
          .where(
            'creationDate',
            isGreaterThanOrEqualTo: Timestamp.fromDate(oneMonthAgo),
          )
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }

  @override
  Future<Either> getCourses() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Courses').get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }

  @override
  Future<Either> getCoursesByCategoryId(String categoryId) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Courses')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }
}
