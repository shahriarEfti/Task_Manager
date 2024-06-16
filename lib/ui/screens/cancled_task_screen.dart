
import 'package:flutter/material.dart';

import '../widgets/task_item.dart';

class CancledTaskScreen extends StatefulWidget {
  const CancledTaskScreen({super.key});

  @override
  State<CancledTaskScreen> createState() => _CancledTaskScreenState();
}

class _CancledTaskScreenState extends State<CancledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context,index){
              return  TaskItem();
            }));

  }
}
