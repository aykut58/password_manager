import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_password_secrity_app/models/password_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class DbHelper
{
   final _databaseName = "/PasswordDatabase.db";
   final _databaseVersion = 3;

   final tableName = 'password_table';

   final columnId = 'id';
   final columnName = 'name';
   final columnPassword = 'password';

  static final DbHelper instance = DbHelper._init();
  static Database? _database;
  DbHelper._init();

   Future<Database> get database async 
  {
    if(_database != null ) return _database!;
    _database ??= await _initDb();
    return _database!;
  } 

  Future <Database> _initDb() async 
  {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + _databaseName;
    return await openDatabase(path , version: _databaseVersion , onCreate: _createDb );
  }

   Future _createDb (Database db , int version) async 
  {
    await db.execute('''
      
      CREATE TABLE $tableName (
                $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $columnName TEXT NOT NULL,
                $columnPassword TEXT NOT NULL
              )
      
      ''',
);
  }
Future<int> insert(PasswordModel passwordModel) async 
  {
    final db = await instance.database;
    final result = await db.insert(
      tableName, 
      passwordModel.toMap(), 
      );
    return result;
  }

  Future<List<PasswordModel>> getTodoList() async {
    final db = await instance.database;

    /// Veritabanı tablosundaki kayıtların tümünü al/getir
    final query = await db.query(tableName);

    /// Kayıtları Map'den Dart nesnelerine Iterable olarak dönüştür
    var map = query.map((json) => PasswordModel.fromMap(json));

    /// Iterable'ı List haline dönüştür.
    final result = map.toList();
    debugPrint(' getTodo List result: $result');
    return result;
  }
}