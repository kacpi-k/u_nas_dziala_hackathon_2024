import 'package:get_it/get_it.dart';
import 'package:u_nas_dziala_hackathon_2024/data/category/repository/category_repository_impl.dart';
import 'package:u_nas_dziala_hackathon_2024/data/category/source/category_firebase_service.dart';
import 'package:u_nas_dziala_hackathon_2024/data/category/source/category_service.dart';
import 'package:u_nas_dziala_hackathon_2024/data/course/repository/course_repository_impl.dart';
import 'package:u_nas_dziala_hackathon_2024/data/course/source/course_firebase_service.dart';
import 'package:u_nas_dziala_hackathon_2024/data/course/source/course_service.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/usecases/get_user.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/usecases/is_logged_in.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/usecases/send_password_reset_email.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/usecases/signup.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/usecases/singin.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/category/repository/category_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/category/usecases/get_categories.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/repository/course_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/usecases/get_courses.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/usecases/get_courses_by_category_id.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/usecases/get_new_in.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  // SERVICES

  sl.registerSingleton<CategoryService>(CategoryFirebaseService());
  sl.registerSingleton<CourseService>(CourseFirebaseService());

  // REPOSITORIES

  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<CourseRepository>(CourseRepositoryImpl());

  // USECASES

  // CATEGORIES
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());

  // COURSES
  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  sl.registerSingleton<GetCoursesUseCase>(GetCoursesUseCase());
  sl.registerSingleton<GetCoursesByCategoryIdUseCase>(GetCoursesByCategoryIdUseCase());

  // AUTH
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<SendPasswordResetEmailUseCase>(
      SendPasswordResetEmailUseCase());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
