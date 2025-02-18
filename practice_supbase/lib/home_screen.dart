import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_supbase/models/emlpoyee.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> addEmployee() async {
    final employee = Employee(
      id: Random().nextInt(1000).toInt(),
      name: _nameController.text,
      age: int.parse(_ageController.text),
      salary: int.parse(_salaryController.text),
    );

    //await Supabase.instance.client.from("students").insert(employee.toMap());
    await Supabase.instance.client.from("students").insert(employee.toMap());
  }

  late List<Map<String, dynamic>> _employees = [];

  Future<void> fetchEmployee() async {
    final response = await Supabase.instance.client
        .from('students')
        .select()
        .order('age', ascending: true)
        .range(0, 4);

    print(response);

    _employees.clear();

    for (var i in response) {
      final data = Employee.fromMap(i);
      _employees.add(
        {
          'id': data.id,
          'name': data.name,
          'age': data.age,
          'salary': data.salary,
        },
      );
    }
    setState(() {});
  }

  Future<void> updateEmployee(
      dynamic id, String name, int age, int salary) async {
    final response = await Supabase.instance.client
        .from('students')
        .update({'name': name, 'age': age, 'salary': salary}).eq('id', id);

    if (response.error == null) {
      // Optionally reload the employee list after updating
      fetchEmployee();
    } else {
      // Handle error
      print('Error updating employee: ${response.error?.message}');
    }
  }

  void deleteEmployee(dynamic selectedEmployeeId) async {
    final response = await Supabase.instance.client
        .from('students')
        .delete()
        .eq('id', selectedEmployeeId);
  }

  void openEditDialog(dynamic selectedEmployee) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Employee"),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) => value!.isEmpty ? "Enter Name" : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: "Age"),
                  validator: (value) => value!.isEmpty ? "Enter Age" : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _salaryController, // Use _salaryController here
                  decoration: InputDecoration(labelText: "Salary"),
                  validator: (value) => value!.isEmpty ? "Enter Salary" : null,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final name = _nameController.text;
                      final age = int.parse(_ageController.text);
                      final salary = int.parse(_salaryController.text);
                      updateEmployee(selectedEmployee!, name, age, salary);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Update Employee"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  File? selectedFile;
  void pickFile() async {
    final pickFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedFile = File(pickFile!.path);
    });
  }

  final SupabaseClient supabase = Supabase.instance.client;
  Future<void> uploadFile() async {
    final String path = 'user1/${selectedFile!.path.split('/').last}';
    await supabase.storage.from('images').upload(path, selectedFile!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Employee Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _salaryController,
                decoration: const InputDecoration(labelText: "Salary"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter salary';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: addEmployee,
                child: const Text("Add Employee"),
              ),
              ElevatedButton(
                onPressed: () {
                  pickFile();
                },
                child: const Text("Pick Image"),
              ),
              selectedFile != null
                  ? Text("Selected ${selectedFile!.path.split('/').last}")
                  : Text("No File Selected"),
              ElevatedButton(
                onPressed: () {
                  uploadFile();
                },
                child: const Text("Upload Image"),
              ),
              SizedBox(height: 10),
              Divider(),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _employees.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_employees[index]['name']),
                      subtitle: Text(
                          'Age : ${_employees[index]['age']}, Salary: ${_employees[index]['salary']} '),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              openEditDialog(_employees[index]['id']);
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteEmployee(_employees[index]['id']);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
