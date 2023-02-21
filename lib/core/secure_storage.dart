import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage 
{
 
   static const storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future writeSecureData(String key , String value)  async
  {
    var writeData = storage.write(key: key, value: value);
    return writeData;
  }

  Future readSecureData(String key) async 
  {
    var readData = storage.read(key: key);
    return readData;
  }

  Future deleteSecureData (String key) async 
  {
    var deleteData = storage.delete(key: key);
    return deleteData;
  }
    Future<Map<String, String>> readAllData() async {
    return await storage.readAll();
  }
  
}