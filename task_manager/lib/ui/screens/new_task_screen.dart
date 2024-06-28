import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapActionButton,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.grey.shade300,
      appBar: profileAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            _buildSummarySection(),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text('Title'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Description'),
                            Text(
                              '12/12/2024',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Chip(
                                  label: Text('New'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 2),
                                ),
                                ButtonBar(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.delete)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
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

  void _onTapActionButton() {
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNewTaskScreen(),
        ),
      );
    }
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
