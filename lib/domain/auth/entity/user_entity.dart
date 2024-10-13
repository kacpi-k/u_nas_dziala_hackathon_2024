class UserEntity {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String profilePictureUrl;
  final String description;
  final List<String> joinedTrainings;

  UserEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.profilePictureUrl,
    required this.description,
    required this.joinedTrainings,
  });
}
