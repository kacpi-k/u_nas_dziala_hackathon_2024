class CourseModel {
  final String courseId;
  final String title;
  final String description;
  final DateTime date;
  final List<String> organizers;
  final List<String> speakers;
  final List<String> participants;
  final List<String> materials;
  final DateTime createdAt;

  CourseModel({
    required this.courseId,
    required this.title,
    required this.description,
    required this.date,
    required this.organizers,
    required this.speakers,
    required this.participants,
    required this.materials,
    required this.createdAt,
  });
}
