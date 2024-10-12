import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/data/category/source/category_service.dart';

class CategoryFirebaseService extends CategoryService {
  @override
  Future<Either> getCategory() async {
    try {
      var categories =
          await FirebaseFirestore.instance.collection('Categories').get();
      return Right(
        categories.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }
}