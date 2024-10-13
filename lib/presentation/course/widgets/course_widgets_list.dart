import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/chatroom/pages/chatRoom_main.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/pages/attachment_page.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/pages/schedule_page.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/questionnaire/pages/questionnaire.dart';

class CourseWidgetList extends StatelessWidget {
  const CourseWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ChatRoomMain();
            }));
          },
          child: const Card(
            child: ListTile(
              title: Text('Komunikator'),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const AttachmentPage();
            }));
          },
          child: const Card(
            child: ListTile(
              title: Text('Materiały do pobrania'),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const SchedulePage();
            }));
          },
          child: const Card(
            child: ListTile(
              title: Text('Harmonogram szkolenia'),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const Questionnaire();
            }));
          },
          child: const Card(
            child: ListTile(
              title: Text('Ankieta uczestnika'),
            ),
          ),
        ),
      ],
    );
  }
}
