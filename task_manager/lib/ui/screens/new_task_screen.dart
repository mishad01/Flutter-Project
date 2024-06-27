import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/profile_app_bar.dart';
import 'package:task_manager/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: profileAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            _buildSummarySection(),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Title'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description'),
                        Text('12/12/2024'),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskSummaryCard(
            title: 'New Task',
            count: '12',
          ),
          TaskSummaryCard(
            title: 'New Task',
            count: '12',
          ),
          TaskSummaryCard(
            title: 'New Task',
            count: '12',
          ),
          TaskSummaryCard(
            title: 'New Task',
            count: '12',
          ),
        ],
      ),
    );
  }
}
