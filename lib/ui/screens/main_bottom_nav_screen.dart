import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancled_task_screen.dart';
import 'package:task_manager/ui/screens/completed_task_screen.dart';
import 'package:task_manager/ui/screens/in_progress_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

import '../widgets/network_cached_image.dart';
import '../widgets/profile_app_bar.dart';


class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}


class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _seleledIndex=0;

  List<Widget> _screens=[
    NewTaskScreen(),
    CompletedTaskScreen(),
    InProgressScreen(),
    CancledTaskScreen(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: _screens[_seleledIndex],


      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.themeColor,

          currentIndex:_seleledIndex,
          onTap:(index)
        {
        _seleledIndex=index;
        if(mounted) {
          setState(() {});
        }
        },

          items: [
        BottomNavigationBarItem(icon: Icon(Icons.abc_sharp),label: "New Task"),
        BottomNavigationBarItem(icon: Icon(Icons.done),label: "Completed"),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: "In Progress"),
        BottomNavigationBarItem(icon: Icon(Icons.close),label: "Canceled"),
      ]),
    );
  }
}

