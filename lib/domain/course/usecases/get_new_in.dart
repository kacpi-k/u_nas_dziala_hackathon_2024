import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/core/usecase/usecase.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/repository/course_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class GetNewInUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CourseRepository>().getNewIn();
  }
}
