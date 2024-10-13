import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/core/usecase/usecase.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/repository/auth_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<AuthRepository>().sendPasswordResetEmail(params!);
  }
}