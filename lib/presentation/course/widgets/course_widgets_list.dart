import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/chatroom/pages/chatRoom_main.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/pages/attachment_page.dart';

class CourseWidgetList extends StatelessWidget {
  const CourseWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return ChatRoomMain();
            }));
          },
          child: Card(
            child: ListTile(
              title: Text('Komunikator'),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return AttachmentPage();
            }));
          },
          child: Card(
            child: ListTile(
              title: Text('Materiały do pobrania'),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return ChatRoomMain();
            }));
          },
          child: Card(
            child: ListTile(
              title: Text('Harmonogram szkolenia'),
            ),
          ),
        ),
      ],
    );
  }
}
