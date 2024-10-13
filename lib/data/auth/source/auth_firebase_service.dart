import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_creation_req.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_sigin_req.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/source/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService extends AuthService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(
            returnedData.user!.uid,
          )
          .set({
        'userId': returnedData.user!.uid,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'role': user.role,
        'profilePictureUrl': user.profilePictureUrl,
        'description': user.description,
        'joinedTrainings': user.joinedTrainings,
      });

      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'Password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account with that email already exists';
      } else if (e.code == 'invalid-email') {
        message = 'Email provided is invalid';
      } else {
        message = 'Something went wrong';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return const Right('Sign in was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        message = 'Wrong email or password';
      } else if (e.code == 'invalid-email') {
        message = 'Email provided is invalid';
      } else {
        message = 'Something went wrong + ${e.code}';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Password reset email has been sent');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Email provided is invalid';
      } else {
        message = 'Please try again';
      }
      return Left(message);
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(
            currentUser?.uid,
          )
          .get()
          .then((value) => value.data());
      return Right(userData);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
