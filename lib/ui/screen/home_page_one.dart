import 'package:crud_project/ui/screen/add_new_task.dart';
import 'package:crud_project/ui/screen/bottom_home_task.dart';
import 'package:crud_project/ui/screen/cancel_task.dart';
import 'package:crud_project/ui/screen/completed_task.dart';
import 'package:crud_project/ui/screen/progress_task.dart';
import 'package:flutter/material.dart';

class HomePageOne extends StatefulWidget {
  const HomePageOne({super.key});

  @override
  State<HomePageOne> createState() => _HomePageOneState();
}

class _HomePageOneState extends State<HomePageOne> {

  int _selectedIndex = 0;
  List<Widget> _screen = const [
      BottomHomeTask(),
      ProgressTask(),
      CancelTask(),
      CompletedTask(),
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index){
            _selectedIndex = index;
            setState(() {
            });
          },
          destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.refresh), label: "Refersh"),
        NavigationDestination(icon: Icon(Icons.done), label: "Completed"),
        NavigationDestination(icon: Icon(Icons.cancel), label: "Cancelled"),
      ]),
    );
  }
}
