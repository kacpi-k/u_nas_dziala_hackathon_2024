class UserCreationReq {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? role;
  String? profilePictureUrl;
  String? description;
  List<String>? joinedTrainings;

  UserCreationReq({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
