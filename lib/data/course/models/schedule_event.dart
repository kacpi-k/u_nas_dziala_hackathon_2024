import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/schedule_event_entity.dart';

class ScheduleEventModel {
  final String title;
  final Timestamp startTime;
  final Timestamp endTime;

  ScheduleEventModel({
    required this.title,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory ScheduleEventModel.fromMap(Map<String, dynamic> map) {
    return ScheduleEventModel(
      title: map['title'] as String,
      startTime: map['startTime'] as Timestamp,
      endTime: map['endTime'] as Timestamp
    );
  }
}

extension ScheduleEventXModel on ScheduleEventModel {
  ScheduleEventEntity toEntity() {
    return ScheduleEventEntity(
      title: title,
      startTime: startTime,
      endTime: endTime,
    );
  }
}

extension ScheduleEventXEntity on ScheduleEventEntity {
  ScheduleEventModel fromEntity() {
    return ScheduleEventModel(
      title: title,
      startTime: startTime,
      endTime: endTime,
    );
  }
}
