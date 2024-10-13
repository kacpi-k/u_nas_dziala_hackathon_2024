import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/course/entity/course_entity.dart';

class GoalsList extends StatelessWidget {
  final CourseEntity courseEntity;
  const GoalsList({
    super.key,
    required this.courseEntity,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: courseEntity.goals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(courseEntity.goals[index]),
            //subtitle: Text('Cel ${courseEntity.goals[index]}'),
            trailing: const Icon(Icons.check),
          );
        });
  }
}
