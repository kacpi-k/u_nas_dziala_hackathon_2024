class ScheduleEventModel {
  final String title;
  final String? description;
  final DateTime startTime;
  final DateTime? endTime;

  ScheduleEventModel({
    required this.title,
    this.description,
    required this.startTime,
    this.endTime,
  });
}
