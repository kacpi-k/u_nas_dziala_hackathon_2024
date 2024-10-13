import 'package:flutter/material.dart';

class GoalsList extends StatelessWidget {
  const GoalsList({
    super.key,
    required this.goalsList,
  });

  final List goalsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: goalsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(goalsList[index]),
              subtitle: Text('This is goal ${goalsList[index]}'),
              trailing: Icon(Icons.check),
            );
          }),
    );
  }
}
