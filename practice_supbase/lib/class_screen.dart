import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_supbase/models/class_model.dart';
import 'package:practice_supbase/subjects_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClassScreen extends StatefulWidget {
  final String categoryId; // Accept categoryId from Categories screen

  const ClassScreen({super.key, required this.categoryId});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _classes = [];

  Future<void> addClass() async {
    final newClass = ClassModel(
      categoryId: widget.categoryId, // Assign foreign key
      name: _nameController.text.trim(),
    );
    await Supabase.instance.client.from("classes").insert(newClass.toMap());

    fetchClasses();
  }

  Future<void> fetchClasses() async {
    final response = await Supabase.instance.client
        .from('classes') // Correct table name is "classes"
        .select()
        .eq('category_id', widget.categoryId); // Use the correct column name

    _classes.clear();
    for (var i in response) {
      final data = ClassModel.fromMap(i);
      _classes.add({
        'id': data.id,
        'name': data.name,
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Classes")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Class Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a class name';
                      }
                      return null;
                    },
                  ),
                  Text("Category ID: ${widget.categoryId}"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: addClass,
                    child: const Text("Add Class"),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _classes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_classes[index]['name']),
                    subtitle: Text('ID: ${_classes[index]['id']}'),
                    onTap: () {
                      Get.to(
                          () => SubjectsScreen(classId: _classes[index]['id']));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
