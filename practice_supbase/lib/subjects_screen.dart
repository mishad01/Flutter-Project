import 'package:flutter/material.dart';
import 'package:practice_supbase/models/subject_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({
    super.key,
    required this.classId,
  });
  final String classId;

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _subjects = [];

  Future<void> addSubject() async {
    final newSubject = SubjectModel(
        classId: widget.classId, subjectName: _nameController.text);

    await Supabase.instance.client.from('subjects').insert(newSubject.toMap());
    fetchSubjects();
  }

  Future<void> fetchSubjects() async {
    final reponse = await Supabase.instance.client
        .from('subjects')
        .select()
        .eq('class_id', widget.classId);

    _subjects.clear();

    for (var i in reponse) {
      final data = SubjectModel.fromMap(i);
      _subjects.add({
        'id': data.id,
        'name': data.subjectName,
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subjects")),
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
                    decoration:
                        const InputDecoration(labelText: "Subject Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a subject name';
                      }
                      return null;
                    },
                  ),
                  Text("Category ID: ${widget.classId}"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: addSubject,
                    child: const Text("Add Subject"),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _subjects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_subjects[index]['name']),
                    subtitle: Text('ID: ${_subjects[index]['id']}'),
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
