import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_creation_req.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_sigin_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
