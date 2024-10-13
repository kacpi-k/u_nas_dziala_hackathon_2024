import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/message.dart';

class ChatRoomServices extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String reciverId, String message) async {
    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final String currentUserEmail =
        FirebaseAuth.instance.currentUser!.email.toString();
    final Timestamp timeStamp = Timestamp.now();

    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        reciverId: reciverId,
        message: message,
        timestamp: timeStamp);

    List<String> iDs = [currentUserId, reciverId];
    iDs.sort();
    String chatRoomId = iDs.join("_");

    await FirebaseFirestore.instance
        .collection('ChatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());

    
  }
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
      List<String> iDs = [userId, otherUserId];
      iDs.sort();
      String chatRoomId = iDs.join("_");

      return _firebaseFirestore
          .collection('ChatRooms')
          .doc(chatRoomId)
          .collection('messages')
          .orderBy('timestamp', descending: false)
          .snapshots();
    }
}
