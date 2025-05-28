import 'package:get/get.dart';
import '../data/models/chat_model.dart';

class ChatController extends GetxController {
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxBool isLoading = false.obs;
  final RxString selectedModel = 'gpt-3.5-turbo'.obs;

  final List<String> availableModels = [
    'gpt-3.5-turbo',
    'gpt-4',
    'claude-2',
    'gemini-pro',
  ];

  void setSelectedModel(String model) {
    selectedModel.value = model;
  }

  Future<void> sendMessage(String message) async {
    try {
      isLoading.value = true;

      // Add user message
      messages.add(ChatMessage(
        id: DateTime.now().toString(),
        message: message,
        timestamp: DateTime.now(),
        isUser: true,
      ));

      // Simulate AI response delay
      await Future.delayed(const Duration(seconds: 2));

      // Add AI response
      messages.add(ChatMessage(
        id: DateTime.now().toString(),
        message: 'This is a dummy response from ${selectedModel.value}',
        aiModel: selectedModel.value,
        timestamp: DateTime.now(),
        isUser: false,
      ));
    } finally {
      isLoading.value = false;
    }
  }

  void clearChat() {
    messages.clear();
  }

  List<ChatMessage> get savedMessages =>
      messages.where((message) => !message.isUser).toList();
}
