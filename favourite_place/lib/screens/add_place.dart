import 'package:flutter/material.dart';

class AddPlaceSreen extends StatefulWidget {
  AddPlaceSreen({super.key});
  @override
  State<AddPlaceSreen> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceSreen> {
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD PLACE'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(label: Text('Title')),
                controller: _titleController,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 15)),
                  onPressed: () {},
                  child: Text('ADD')),
            ],
          ),
        ),
      ),
    );
  }
}
