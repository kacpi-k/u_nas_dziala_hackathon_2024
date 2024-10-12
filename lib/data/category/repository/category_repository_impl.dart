import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/data/category/models/category.dart';
import 'package:u_nas_dziala_hackathon_2024/data/category/source/category_service.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/category/repository/category_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryService>().getCategory();
    return categories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => CategoryModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }
}