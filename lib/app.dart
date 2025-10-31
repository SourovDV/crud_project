import 'package:crud_project/routers/router_page.dart';
import 'package:crud_project/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterPage.router,
    );
  }
}
