import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';
import 'package:task_manager/ui/widgets/profile_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController _titleTEController=  TextEditingController();
  final TextEditingController _descriptionTEController=  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(context),
      body:BackgroundWidget(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                      children: [
              TextFormField(
                controller: _titleTEController,
                decoration: const InputDecoration(
                  hintText: "Title"
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: _descriptionTEController,
                decoration: const InputDecoration(
                    hintText: "Description"
                ),
                maxLines: 4,
              ),

             const SizedBox(height: 16,),
                        ElevatedButton(onPressed: (){}, child: const Text("Add"))
                      ],
                    ),
            ),
          ))
    );
  }

  @override
  void dispose(){
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();

  }
}

