import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/core/usecase/usecase.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_creation_req.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/repository/auth_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
