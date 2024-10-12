import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';

class AttachmentPage extends StatelessWidget {
  const AttachmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    List attachmentList = ['Regulamin szkolenia', 'Wstęp do programowania obiektowego','JavaScript w praktyce'];
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Center(child: Text('Materiały szkoleniowe', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: attachmentList.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text(attachmentList[index]),
                      trailing: Icon(Icons.more_vert),
                    ),
                  );
                }),
            )
          ],
        ),
      ),
    );
  }
}