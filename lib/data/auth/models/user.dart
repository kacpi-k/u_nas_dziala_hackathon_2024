class UserModel {
  final String userId;
  final String name;
  final String email;
  final String role;
  final String? profilePictureUrl;
  final String? description;
  final List<String>? joinedTrainings;
  final DateTime createdAt;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    this.profilePictureUrl,
    this.description,
    this.joinedTrainings,
    required this.createdAt,
  });
}
