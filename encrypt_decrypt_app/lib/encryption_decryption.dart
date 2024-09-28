import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionDecryption {
  String encryptedText = '';
  String decryptedText = '';
  final key = encrypt.Key.fromUtf8('my 32 length key................');
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(
      encrypt.AES(encrypt.Key.fromUtf8('my 32 length key................')));
  var encrypted;
  String encryptText(String text) {
    encrypted = encrypter.encrypt(text, iv: iv);
    encryptedText = encrypted.base64;
    return encryptedText;
  }

  String decryptText(var text) {
    decryptedText = encrypter.decrypt(encrypted, iv: iv);
    return decryptedText;
  }
}
