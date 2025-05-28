class ChatMessage {
  final String? id;
  final String? message;
  final String? aiModel;
  final DateTime? timestamp;
  final bool isUser;

  ChatMessage({
    this.id,
    this.message,
    this.aiModel,
    this.timestamp,
    this.isUser = false,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json['id'],
        message: json['message'],
        aiModel: json['ai_model'],
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : null,
        isUser: json['is_user'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'ai_model': aiModel,
        'timestamp': timestamp?.toIso8601String(),
        'is_user': isUser,
      };
}
