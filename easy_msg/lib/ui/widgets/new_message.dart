import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_msg/services/encryption_decryption.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final key = encrypt.Key.fromUtf8('my 32 length key................');
  final iv = encrypt.IV.fromLength(16);
  final TextEditingController _messageTEController = TextEditingController();

  // Instantiate the EncryptionDecryption class
  final EncryptionDecryption encryptionDecryption = EncryptionDecryption();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageTEController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                  hintText: 'Send Message..',
                  hintStyle: TextStyle(fontWeight: FontWeight.w200)),
            ),
          ),
          IconButton(
            onPressed: _submitMessage,
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
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

    // Encrypt the message
    String encryptedMessage =
        encryptionDecryption.encryptText(enteredMessage, key, iv);

    // Send to Firebase
    FocusScope.of(context).unfocus();
    _messageTEController.clear();

    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': encryptedMessage, // Store the encrypted message
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()!['username'],
      'userImage': userData.data()!['image_url'],
      // Optionally, store key and iv if needed
      'key': key.base64, // Convert key to base64 to store as string
      'iv': iv.base64, // Convert iv to base64 to store as string
    });
  }

  @override
  void dispose() {
    super.dispose();
    _messageTEController.dispose();
  }
}
