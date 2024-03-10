// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:currency_app/core/component.dart';
import 'package:currency_app/current_project.dart/model/transaction.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class SqlLiteDB {
  static Database? _db;
  final String _databaseName = "currency_app.db";

  Future<Database> get database async {
    if (_db == null) {
      _db = await _initialDatabase();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future<Database> _initialDatabase() async {
    String defaultPath = await getDatabasesPath();

    String path = join(defaultPath, _databaseName);

    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1);

    return mydb;
  }

  Future<void> _onCreate(Database mydb, int version) async {
    // mydb.execute('''
    // CREATE TABLE Currency (
    // countryCode Varchar(100),
    // countryName Varchar(1000),
    // countryFlag Varchar(1000)
    // )
    // ''');

    mydb.execute('''
    CREATE TABLE Trasnaction (
    selectedDate        Date,
    countryCode1        Varchar(100),
    countryName1        Varchar(1000),
    countryFlag1        Varchar(1000),  
    currencyPrice1      float,
    countryCode2        Varchar(100),
    countryName2        Varchar(1000),
    countryFlag2        Varchar(1000),
    currencyPrice2      float
    )
    ''');
  }

  Future<void> insertBatch(List<Map<String, Object?>> data, String tableName) async {
    final Database db = await database;
    final Batch batch = db.batch();

    for (var emp in data) {
      batch.insert(tableName, emp);
    }

    await batch.commit();
  }

  Future<int> update(String tableName, String values, String where) async {
    final Database db = await database;

    int response = await db.rawUpdate("Update $tableName set $values $where");

    return response;
  }

  Future<int> delete(String tableName, String where) async {
    final Database db = await database;

    int response = await db.rawDelete("DELETE FROM $tableName $where");

    return response;
  }

  // Future<List<Currency>> getAllCurrencies() async {
  //   final Database db = await database;
  //   List response = await db.rawQuery("select * from Currency");
  //   return response.map((e) => Currency.fromJson(e)).toList();
  // }

  Future<List<Trasnaction>> getCurrencyTrasnactions() async {
    final Database db = await database;

    String fromDate = DateFormat(dateFormate).format(DateTime.now());

    DateTime d = DateTime.now().subtract(const Duration(days: 7));

    String toDate = DateFormat(dateFormate).format(d);

    // delete("Trasnaction", "");

    String qury = '''
      select * from Trasnaction
      where DATE(selectedDate) Between DATE('$toDate') and DATE('$fromDate')
      order by selectedDate DESC Limit 2 
    ''';

    var response = await db.rawQuery(qury);

    log(jsonEncode(response));

    List<Trasnaction> list = response.map((e) => Trasnaction.fromJson(e)).toList();

    return list;
  }
}
