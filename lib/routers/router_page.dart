import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/screen/home_screen.dart';
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
    ],
  );
}
