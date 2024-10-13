import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/schedule_event_entity.dart';

class CourseEntity {
  final String courseId;
  final String categoryId;
  final String title;
  final String description;
  final String img;
  final int price;
  final Timestamp date;
  final List<String> goals;
  final List<String> organizers;
  final List<String> speakers;
  final List<String> participants;
  final List<String> materials;
  final List<ScheduleEventEntity> schedule;
  final Timestamp creationDate;

  CourseEntity({
    required this.courseId,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.img,
    required this.price,
    required this.date,
    required this.goals,
    required this.organizers,
    required this.speakers,
    required this.participants,
    required this.materials,
    required this.schedule,
    required this.creationDate,
  });
}
