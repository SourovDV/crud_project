import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/screen/add_new_task.dart';
import 'package:crud_project/ui/screen/bottom_home_task.dart';
import 'package:crud_project/ui/screen/forgot_email_verification_screen.dart';
import 'package:crud_project/ui/screen/forgot_pin_verification.dart';
import 'package:crud_project/ui/screen/home_page_one.dart';
import 'package:crud_project/ui/screen/set_password.dart';
import 'package:crud_project/ui/screen/sign_in.dart';
import 'package:crud_project/ui/screen/sign_up_page.dart';
import 'package:crud_project/ui/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class RouterPage {
 static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRouter.splashScreen,
        name: AppRouter.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRouter.homeScreen,
        name: AppRouter.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRouter.signUpScreen,
        name: AppRouter.signUpScreen,
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: AppRouter.forgotScreen,
        name: AppRouter.forgotScreen,
        builder: (context, state) => ForgotEmailVerificationScreen(),
      ),
      GoRoute(
        path: AppRouter.pinVerification,
        name: AppRouter.pinVerification,
        builder: (context, state) => ForgotPinVerification(),
      ),
      GoRoute(
        path: AppRouter.setPassword,
        name: AppRouter.setPassword,
        builder: (context, state) => SetPassword(),
      ),
      GoRoute(
        path: AppRouter.homePageOne,
        name: AppRouter.homePageOne,
        builder: (context, state) => HomePageOne(),
      ),
      GoRoute(
        path: AppRouter.bottomHomeTask,
        name: AppRouter.bottomHomeTask,
        builder: (context, state) => BottomHomeTask(),
      ),
      GoRoute(
        path: AppRouter.addNesTask,
        name: AppRouter.addNesTask,
        builder: (context, state) => AddNewTask(),
      ),
    ],
  );
}
