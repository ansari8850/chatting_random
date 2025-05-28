import 'package:get/get.dart';
import 'package:chatting_application_agent/app/controllers/chat_controller.dart';

class ChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
