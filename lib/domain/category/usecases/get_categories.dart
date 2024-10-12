import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/core/usecase/usecase.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/category/repository/category_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class GetCategoriesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}