import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final TextEditingController _messageTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageTEController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(labelText: 'Send Message..'),
            ),
          ),
          IconButton(
            onPressed: _submitMessage,
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.send),
          )
        ],
      ),
    );
  }

  void _submitMessage() async {
    final enteredMessage = _messageTEController.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }
    //send to Firebase
    _messageTEController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _messageTEController.dispose();
  }
}