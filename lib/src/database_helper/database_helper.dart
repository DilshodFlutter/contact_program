import 'dart:async';

import 'package:contact_program/src/model/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableName = 'contacTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnNumber = 'number';

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'jaska.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $tableName('
      '$columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$columnName TEXT, '
      '$columnNumber TEXT)',
    );
  }

  Future<int> saveData(ContactModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableName,
      item.toJson(),
    );
    return result;
  }

  Future<List<ContactModel>> getData() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableName');
    List<ContactModel> products = <ContactModel>[];
    for (int i = 0; i < list.length; i++) {
      ContactModel items = ContactModel(
        id: list[i][columnId],
        name: list[i][columnName],
        number: list[i][columnNumber],
      );
      products.add(items);
    }
    return products;
  }

  Future<int> deleteData(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateData(ContactModel products) async {
    var dbClient = await db;
    return await dbClient.update(
      tableName,
      products.toJson(),
      where: "$columnId = ?",
      whereArgs: [products.id],

    );
  }
}
