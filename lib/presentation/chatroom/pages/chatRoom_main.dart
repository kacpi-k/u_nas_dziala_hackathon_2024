// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
// import 'package:u_nas_dziala_hackathon_2024/presentation/chatroom/pages/chatPage.dart';

// class ChatRoomMain extends StatelessWidget {
//   const ChatRoomMain({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BasicAppbar(),
//       body: ,
//     )
//     ;
//   }
//   Widget _usersList(){
    
//     return StreamBuilder(
//       stream: , 
//       builder: (context, snapshots){
//         List <Widget>usersList = []; //dodac snapshot z firebasea
//         return ListView(
          
//           children: usersList,
//         );
//       });
//   }
//   Widget _userListItem(DocumentSnapshot document){
//     List usersList = [];
//     if(_auth.currentUser!.email != data['email']){
//       return ListTile(
//       title: Text(data['email']),
//       onTap: (){
//         Navigator.push(
//           context, 
//         MaterialPageRoute(builder: (context)=> ChatPage(
//           reciverUserEmail: data['email'],
//           reciverUserID: data['uid'],
//         )));
//       },);
//     }
//     else{
//       return Container();
//     }
//   }
// }

