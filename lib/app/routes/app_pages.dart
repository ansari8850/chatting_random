import 'package:get/get.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/auth/register/register_binding.dart';
import '../modules/auth/register/register_view.dart';
import '../modules/navigation/navigation_binding.dart';
import '../modules/navigation/navigation_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/chat/chat_binding.dart';
import '../modules/chat/chat_view.dart';
import '../modules/subscription/subscription_binding.dart';
import '../modules/subscription/subscription_view.dart';
import '../modules/saved/saved_binding.dart';
import '../modules/saved/saved_view.dart';
import '../modules/chats/chats_binding.dart';
import '../modules/chats/chats_view.dart';
import '../modules/user_profile/user_profile_view.dart';
import '../modules/post_detail/post_detail_view.dart';
import '../modules/user_detail/user_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.SUBSCRIPTION,
      page: () => const SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: Routes.SAVED,
      page: () => const SavedView(),
      binding: SavedBinding(),
    ),
    GetPage(
      name: Routes.CHATS,
      page: () => const ChatsView(),
      binding: ChatsBinding(),
    ),
    GetPage(
      name: Routes.USER_PROFILE,
      page: () => const UserProfileView(),
    ),
    GetPage(
      name: Routes.POST_DETAIL,
      page: () => const PostDetailView(),
    ),
    GetPage(
      name: Routes.USER_DETAIL,
      page: () => const UserDetailView(),
    ),
  ];
}
