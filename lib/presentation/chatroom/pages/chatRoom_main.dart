import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/source/auth_firebase_service.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/chatroom/pages/chatPage.dart';

class ChatRoomMain extends StatefulWidget {
  const ChatRoomMain({super.key});

  @override
  State<ChatRoomMain> createState() => _ChatRoomMainState();
}

class _ChatRoomMainState extends State<ChatRoomMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: _usersList(),
    )
    ;
  }

  Widget _usersList(){
    
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(), 
      builder: (context, snapshots){
        if (snapshots.hasError){
          return Text('Error');
        }

        if(snapshots.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }


        
        return ListView(
          
          children: snapshots.data!.docs.map<Widget>((doc) => _userListItem(doc)).toList()
        );
      });
  }

  Widget _userListItem(DocumentSnapshot document){
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    Map<String, dynamic>data = document.data!() as Map<String,dynamic>;
    //var currentUser = AuthFirebaseService().getUser();
    if(user.email != data['email']){
      return ListTile(
      title: Text(data['email']),
      onTap: (){
        Navigator.push(
        context, 
        MaterialPageRoute(builder: (context)=> ChatPage(
          reciverUserEmail: data['email'],
          reciverUserID: data['userId'],
        )));
      },);
    }
    else{
      return Container();
    }
  }
}

