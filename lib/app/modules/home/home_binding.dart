import 'package:chatting_application_agent/app/controllers/chat_controller.dart';
import 'package:chatting_application_agent/app/controllers/user_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
