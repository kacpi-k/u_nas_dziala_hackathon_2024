import 'package:get_it/get_it.dart';
import 'package:u_nas_dziala_hackathon_2024/data/category/repository/category_repository_impl.dart';
import 'package:u_nas_dziala_hackathon_2024/data/category/source/category_firebase_service.dart';
import 'package:u_nas_dziala_hackathon_2024/data/category/source/category_service.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/category/repository/category_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/category/usecases/get_categories.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  // SERVICES

  sl.registerSingleton<CategoryService>(CategoryFirebaseService());

  // REPOSITORIES

  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());

  // USECASES

  // CATEGORIES
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
}
