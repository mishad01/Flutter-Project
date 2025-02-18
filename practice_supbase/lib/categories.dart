import 'package:flutter/material.dart';
import 'package:practice_supbase/class_screen.dart';
import 'package:practice_supbase/models/categories_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late List<Map<String, dynamic>> _categories = [];

  Future<void> addCategory() async {
    final category = CategoriesModel(name: _nameController.text);
    await Supabase.instance.client.from("categories").insert(category.toMap());
    fetchCategory(); // Refresh the list
  }

  Future<void> fetchCategory() async {
    final response = await Supabase.instance.client.from('categories').select();

    _categories.clear();
    for (var i in response) {
      final data = CategoriesModel.fromMap(i);
      _categories.add({
        'id': data.id,
        'name': data.name,
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
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
                        const InputDecoration(labelText: "Category Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: addCategory,
                    child: const Text("Add Category"),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_categories[index]['name']),
                    subtitle: Text('ID: ${_categories[index]['id']}'),
                    trailing: const Icon(
                        Icons.arrow_forward), // Indicating navigation
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ClassScreen(categoryId: _categories[index]['id']),
                        ),
                      );
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
