import 'package:flutter/material.dart';

class CustomGoalslist extends StatelessWidget {
  final List goalsList;
  const CustomGoalslist({super.key, required this.goalsList});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          for(var goal in goalsList)
          ListTile(
            title: Text(goal),
          )
        ],
    );
  }
}