import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionDecryption {
  static String encryptedText = '';
  String decryptedText = '';

  // Encrypt the text
  String encryptText(String text, final encrypt.Key key, final encrypt.IV iv) {
    final encrypt.Encrypter encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    encryptedText = encrypted.base64;
    return encryptedText;
  }

  // Decrypt the text
  String decryptText(String text, String key, String iv) {
    try {
      // Convert the base64 key and IV to encrypt.Key and encrypt.IV
      final encrypt.Key aesKey = encrypt.Key.fromBase64(key);
      final encrypt.IV aesIv = encrypt.IV.fromBase64(iv);

      final encrypt.Encrypter encrypter =
          encrypt.Encrypter(encrypt.AES(aesKey));
      final encryptedText = encrypt.Encrypted.fromBase64(text);
      decryptedText = encrypter.decrypt(encryptedText, iv: aesIv);
      return decryptedText;
    } catch (e) {
      print('Decryption error: $e'); // Print error for debugging
      return 'Decryption failed'; // Return a user-friendly message
    }
  }
}
