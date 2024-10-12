import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleEventEntity {
  final String title;
  final Timestamp startTime;
  final Timestamp endTime;

  ScheduleEventEntity({
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
