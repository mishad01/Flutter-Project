import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/model/task_list_wrapper_model.dart';
import 'package:task_manager/data/model/task_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/snak_bar_message.dart';
import 'package:task_manager/ui/widgets/task_item.dart';
import 'package:task_manager/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskInProgress = false;
  List<TaskModel> newTaskList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNewTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            _buildSummarySection(),
            const SizedBox(height: 8),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  _getNewTask();
                },
                child: Visibility(
                  visible: _getNewTaskInProgress == false,
                  replacement: CircularProgressIndicator(),
                  child: ListView.builder(
                    itemCount: newTaskList.length,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        taskModel: newTaskList[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        backgroundColor: AppColors.themeColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onTapAddButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
  }

  Future<void> _getNewTask() async {
    _getNewTaskInProgress = true;
    if (mounted) setState(() {});
    NetworkResponse response = await NetworkCaller.getRequest(Urls.newTasks);
    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
          TaskListWrapperModel.fromJson(response.responseData);
      newTaskList = taskListWrapperModel.taskList ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Get new task failed! Try again');
      }
    }
    _getNewTaskInProgress = false;
    if (mounted) setState(() {});
  }

  Widget _buildSummarySection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskSummaryCard(
            title: 'New Task',
            count: '34',
          ),
          TaskSummaryCard(
            title: 'Completed',
            count: '34',
          ),
          TaskSummaryCard(
            title: 'In Progress',
            count: '34',
          ),
          TaskSummaryCard(
            title: 'Cancelled',
            count: '34',
          ),
        ],
      ),
    );
  }
}
