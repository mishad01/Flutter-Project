import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formState,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 160),
                  Text(
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _subjectTEController,
                    decoration: InputDecoration(hintText: 'Subject'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLines: 5,
                    controller: _descriptionTEController,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formState.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNewTaskScreen(),
                          ),
                        );
                      }
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void _onTapConfirmPassword() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => SignUpScreen(),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _subjectTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
