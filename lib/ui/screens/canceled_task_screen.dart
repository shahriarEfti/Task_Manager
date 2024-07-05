import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_wrapper_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicator.dart';
import 'package:task_manager/ui/widgets/profile_app_bar.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/task_item.dart';

import '../../data/models/task_model.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  bool _cancelledTaskInProgress = false;
  List<TaskModel> cancelledTaskList = [];

  @override
  void initState() {
    super.initState();
    _getCancelledTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _cancelledTaskInProgress
          ? const CenteredProgressIndicator()
          : RefreshIndicator(
        color: AppColor.themeColor,
        onRefresh: () async {
          await _getCancelledTask();
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: cancelledTaskList.length,
            itemBuilder: (context, index) {
              return TaskListItem(
                taskModel: cancelledTaskList[index],
                labelBgColor: AppColor.cancelledLabelColor,
                onUpdateTask: () {
                  _getCancelledTask();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getCancelledTask() async {
    setState(() {
      _cancelledTaskInProgress = true;
    });

    NetworkResponse response = await NetworkCaller.getResponse(Urls.canceledTask);

    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
      TaskListWrapperModel.fromJson(response.responseData);
      cancelledTaskList = taskListWrapperModel.taskList ?? [];
    } else {
      _setCustomToast(
        response.errorMessage ?? "Get cancelled task failed!",
        Icons.error_outline,
        AppColor.red,
        AppColor.white,
      );
    }

    _cancelledTaskInProgress = false;

    if (mounted) {
      setState(() {});
    }
  }


  void _setCustomToast(String message, IconData icon, Color bgColor, Color textColor) {
    final snackBar = SnackBar(
      content: Row(
        children: <Widget>[
          Icon(icon, color: textColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
      backgroundColor: bgColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class AppColor {
  static const themeColor = Colors.blue;
  static const cancelledLabelColor = Colors.red;
  static const red = Colors.red;
  static const white = Colors.white;
}
