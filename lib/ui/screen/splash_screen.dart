import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/screen/home_screen.dart';
import 'package:crud_project/ui/weight/app_logo.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    moveToNextPage();
  }

  Future<void> moveToNextPage()async{
    await Future.delayed(const Duration(seconds: 2));
    context.goNamed(AppRouter.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(child: Center(child: AppLogo())),
    );
  }
}
