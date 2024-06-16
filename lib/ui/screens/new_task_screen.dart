import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import '../widgets/task_item.dart';
import '../widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
        child: Column(
          children: [
          buildSummarySection(),
          SizedBox(height: 8,),
          Expanded(
          child: ListView.builder(
            itemCount: 5,
          itemBuilder: (context,index){
          return TaskItem();
            }))
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: _onTapAddButton,
        backgroundColor: AppColors.themeColor,
        foregroundColor: Colors.white,

      child: Icon(Icons.add,
      ),),
      
    );
  }


  Widget buildSummarySection() {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TaskSummaryCard(
                title: "New Task",
                count: "34",
              ),
              TaskSummaryCard(
                title: "Completed",
                count: "20",
              ),
              TaskSummaryCard(
                title: "In Progress",
                count: "12",
              ),
              TaskSummaryCard(
                title: "Cancled",
                count: "4",
              )
            ],
          ),
        );
  }



void _onTapAddButton(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewTaskScreen()));

}
}




