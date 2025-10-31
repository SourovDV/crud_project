import 'package:crud_project/routers/router_page.dart';
import 'package:crud_project/ui/screen/splash_screen.dart';
import 'package:crud_project/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold
          ),
        ),
        colorSchemeSeed: AppColor.appColor,
        inputDecorationTheme: InputDecorationThemeData(
          hintStyle: TextStyle(
            color: Colors.grey
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.appColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              fixedSize: Size.fromWidth(double.maxFinite),
              padding: EdgeInsets.symmetric(vertical: 20),
              foregroundColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 20,
              )
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: RouterPage.router,
    );
  }
}
