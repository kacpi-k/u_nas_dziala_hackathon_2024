import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/chatroom/pages/chatRoomServices/chatRoomServices.dart';

class ChatPage extends StatefulWidget {
  final String reciverUserEmail;
  final String reciverUserID;
  const ChatPage(
      {super.key, required this.reciverUserEmail, required this.reciverUserID});

  @override
  State<ChatPage> createState() => _ChatpageState();
}

class _ChatpageState extends State<ChatPage> {
  final TextEditingController _message = TextEditingController();
  final ChatRoomServices _chatRoomServices = ChatRoomServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_message.text.isNotEmpty) {
      await _chatRoomServices.sendMessage(widget.reciverUserID, _message.text);
      _message.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text(widget.reciverUserEmail)),
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildMessageInput()],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _message,
          obscureText: false,
          decoration: const InputDecoration(
            hintText: 'Napisz wiadomość...',
          ),
        )),
        IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.arrow_upward,
              size: 40,
            ))
      ],
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

        return Container(
          child: Column(
            children: [
              Text(data['senderEmail']),
              Text(data['message'])
            ],
          )
        );
  }
  Widget _buildMessageList(){
    return StreamBuilder(
      stream: _chatRoomServices.getMessages(widget.reciverUserID, _firebaseAuth.currentUser!.uid), 
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text('Error ${snapshot.error}');
        }

        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }

        return ListView(
          children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList(),
        );
      });
  }
}
