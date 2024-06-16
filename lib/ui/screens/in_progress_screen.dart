import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_app_bar.dart';
import '../widgets/task_item.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context,index){
              return TaskItem();
            }));

  }
}

