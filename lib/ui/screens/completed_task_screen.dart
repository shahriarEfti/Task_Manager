import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_wrapper_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/task_item.dart';

import '../../data/models/task_model.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
  bool _completeTaskInProgress = false;
  List<TaskModel> completeTaskList = [];

  @override
  void initState() {
    super.initState();
    _getCompleteTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _getCompleteTask,
        child: _buildTaskList(),
      ),
    );
  }

  Widget _buildTaskList() {
    if (_completeTaskInProgress) {
      return const CenteredProgressIndicator();
    } else {
      return ListView.builder(
        itemCount: completeTaskList.length,
        itemBuilder: (context, index) {
          return TaskItem(
            taskModel: completeTaskList[index],
            onUpdateTask: _getCompleteTask,
          );
        },
      );
    }
  }

  Future<void> _getCompleteTask() async {
    setState(() {
      _completeTaskInProgress = true;
    });

    NetworkResponse response = await NetworkCaller.getRequest(Urls.completeTask);

    if (mounted) {
      setState(() {
        _completeTaskInProgress = false;
      });
    }

    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
      TaskListWrapperModel.fromJson(response.responseData);
      setState(() {
        completeTaskList = taskListWrapperModel.taskList ?? [];
      });
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          response.errorMessage ?? 'Failed to get complete tasks. Please try again.',
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
