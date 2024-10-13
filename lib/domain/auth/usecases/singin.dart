import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/core/usecase/usecase.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_sigin_req.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/repository/auth_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}