import 'package:get/get.dart';
import '../data/models/user_model.dart';

class UserController extends GetxController {
  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;

  void setUser(UserModel newUser) {
    user.value = newUser;
  }

  void clearUser() {
    user.value = null;
  }

  bool get isLoggedIn => user.value != null;

  bool get hasActiveSubscription {
    if (user.value?.subscriptionEndDate == null) return false;
    return user.value!.subscriptionEndDate!.isAfter(DateTime.now());
  }

  // Dummy login method
  Future<bool> login(String email, String password) async {
    try {
      isLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Dummy user data
      final userData = UserModel(
        id: '1',
        name: 'Test User',
        email: email,
        profileImage: 'https://via.placeholder.com/150',
        subscription: 'free',
        subscriptionEndDate: DateTime.now().add(const Duration(days: 30)),
      );

      setUser(userData);
      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Dummy register method
  Future<bool> register(String name, String email, String password) async {
    try {
      isLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Dummy user data
      final userData = UserModel(
        id: '1',
        name: name,
        email: email,
        profileImage: 'https://via.placeholder.com/150',
        subscription: 'free',
        subscriptionEndDate: DateTime.now().add(const Duration(days: 30)),
      );

      setUser(userData);
      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Logout method
  void logout() {
    clearUser();
  }
}
