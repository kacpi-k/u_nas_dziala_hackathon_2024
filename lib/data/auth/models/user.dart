// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:u_nas_dziala_hackathon_2024/domain/auth/entity/user_entity.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String profilePictureUrl;
  final String description;
  final List<String> joinedTrainings;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.profilePictureUrl,
    required this.description,
    required this.joinedTrainings,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
      'profilePictureUrl': profilePictureUrl,
      'description': description,
      'joinedTrainings': joinedTrainings,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
      profilePictureUrl: map['profilePictureUrl'] as String? ?? '',
      description: map['description'] as String? ?? '',
      joinedTrainings: map['joinedTrainings'].map((e) => e.toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      role: role,
      profilePictureUrl: profilePictureUrl,
      description: description,
      joinedTrainings: joinedTrainings,
    );
  }
}
