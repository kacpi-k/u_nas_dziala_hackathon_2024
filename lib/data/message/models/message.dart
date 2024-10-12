class MessageModel {
  final String messageId;
  final String senderId;
  final String receiverId; // Może być ID użytkownika lub ID czatu grupowego
  final String content;
  final DateTime timestamp;
  final String type; // 'private' lub 'training'

  MessageModel({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
    required this.type,
  });
}
