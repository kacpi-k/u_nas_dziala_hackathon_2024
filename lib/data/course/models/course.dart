import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:u_nas_dziala_hackathon_2024/data/course/models/schedule_event.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';

class CourseModel {
  final String courseId;
  final String categoryId;
  final String title;
  final String description;
  final String img;
  final Timestamp date;
  final List<String> goals;
  final List<String> organizers;
  final List<String> speakers;
  final List<String> participants;
  final List<String> materials;
  final List<ScheduleEventModel> schedule;
  final Timestamp creationDate;

  CourseModel({
    required this.courseId,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.img,
    required this.date,
    required this.goals,
    required this.organizers,
    required this.speakers,
    required this.participants,
    required this.materials,
    required this.schedule,
    required this.creationDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'categoryId': categoryId,
      'title': title,
      'description': description,
      'img': img,
      'date': date,
      'goals': goals,
      'organizers': organizers,
      'speakers': speakers,
      'participants': participants,
      'materials': materials,
      'schedule': schedule.map((x) => x.toMap()).toList(),
      'createdAt': creationDate,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      courseId: map['courseId'] as String,
      categoryId: map['categoryId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      img: map['img'] as String,
      date: map['date'] as Timestamp,
      goals: List<String>.from((map['goals'].map((e) => e.toString()))),
      organizers:
          List<String>.from((map['organizers'].map((e) => e.toString()))),
      speakers: List<String>.from((map['speakers'].map((e) => e.toString()))),
      participants:
          List<String>.from((map['participants'].map((e) => e.toString()))),
      materials: List<String>.from((map['materials'].map((e) => e.toString()))),
      schedule: List<ScheduleEventModel>.from(
          map['schedule'].map((e) => ScheduleEventModel.fromMap(e))),
      creationDate: map['creationDate'] as Timestamp,
    );
  }
}

extension CourseXModel on CourseModel {
  CourseEntity toEntity() {
    return CourseEntity(
      courseId: courseId,
      categoryId: categoryId,
      title: title,
      description: description,
      img: img,
      date: date,
      goals: goals,
      organizers: organizers,
      speakers: speakers,
      participants: participants,
      materials: materials,
      schedule: schedule.map((e) => e.toEntity()).toList(),
      creationDate: creationDate,
    );
  }
}

extension CourseXEntity on CourseEntity {
  CourseModel fromEntity() {
    return CourseModel(
      courseId: courseId,
      categoryId: categoryId,
      title: title,
      description: description,
      img: img,
      date: date,
      goals: goals,
      organizers: organizers,
      speakers: speakers,
      participants: participants,
      materials: materials,
      schedule: schedule.map((e) => e.fromEntity()).toList(),
      creationDate: creationDate,
    );
  }
}
