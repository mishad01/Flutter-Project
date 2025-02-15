import 'dart:math';

import 'package:flutter/material.dart';
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
        .order('id', ascending: true);

    _employees.clear();

    for (var i in response) {
      final data = Employee.fromMap(i);
      _employees.add(
        {
          'name': data.name,
          'age': data.age,
          'salary': data.salary,
        },
      );
    }
    setState(() {});
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
