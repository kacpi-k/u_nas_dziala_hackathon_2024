import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_creation_req.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_sigin_req.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/source/auth_service.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/repository/auth_repository.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthService>().signup(user);
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    return await sl<AuthService>().signin(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthService>().getUser();
    return user.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          UserModel.fromMap(data).toEntity(),
        );
      },
    );
  }
}
