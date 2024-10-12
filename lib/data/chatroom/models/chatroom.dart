class ChatRoom {
  final String chatRoomId;
  final List<String> participants;
  final DateTime createdAt;

  ChatRoom({
    required this.chatRoomId,
    required this.participants,
    required this.createdAt,
  });
}
