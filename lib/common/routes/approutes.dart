import 'package:get/get.dart';
import 'package:task/common/routes/index.dart';
import 'package:task/views/auth/profile/index.dart';
import 'package:task/views/auth/signin/index.dart';
import 'package:task/views/auth/signup/index.dart';
import 'package:task/views/home/index.dart';
import 'package:task/views/main/index.dart';
import 'package:task/views/profile/edit_profile.dart/index.dart';
import 'package:task/views/profile/index.dart';
import 'package:task/views/splash/index.dart';

class AppRoutes {
  static List<GetPage> appRoutes = [
    GetPage(
      name: NamedRoutes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: NamedRoutes.SIGNIN,
      page: () => const SignInView(),
      binding: SignInBindings(),
    ),
    GetPage(
      name: NamedRoutes.SIGNUP,
      page: () => const SignUpView(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: NamedRoutes.SIGNUPPROFILE,
      page: () => const SignUpProfileView(),
      binding: SignUpProfileBindings(),
    ),
    GetPage(
      name: NamedRoutes.MAIN,
      page: () => const MainView(),
      binding: MainBindings(),
    ),
    GetPage(
      name: NamedRoutes.HOME,
      page: () => const HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: NamedRoutes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBindings(),
    ),
    GetPage(
      name: NamedRoutes.EDITPROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBindings(),
    ),
  ];
}
