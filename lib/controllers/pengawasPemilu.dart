// import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
// import '../models/absensi.dart';
import 'package:survey/models/pengawasPemilu.dart';

class DbHelper {
  static DbHelper? _dbHelper;
  static Database? _database;

  DbHelper._createObject();

  factory DbHelper(){
    if(_dbHelper == null){
      _dbHelper = DbHelper._createObject();
    }

    return _dbHelper!;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'pengawasPemilu.db';

    var todoDatabase = openDatabase(path, version: 1, onCreate: _creacteDb);

    return todoDatabase;
  }

  void _creacteDb(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE pengawasPemilu (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age TEXT,
        noTps TEXT,
        detailJob TEXT
      )
      '''
    );
  }


    Future<Database> get database async {
      if(_database == null){
        _database = await initDb();
      }

      return _database!;
    }

    // GET DATABASE FOR CRUD
    Future<List<Map<String, dynamic>>> select() async{
      Database db = await this.database;
      var mapList = await db.query('pengawasPemilu', orderBy: 'name');
      return mapList;
    }

    Future<int> create(PengawasPemilu object) async{
      Database db = await this.database;
      int count = await db.insert('pengawasPemilu', object.toMap());
      return count;
    }

    Future<int> update(PengawasPemilu object) async{
      Database db = await this.database;
      int count = await db.update('pengawasPemilu', object.toMap(), where: 'id = ?', whereArgs: [object.id]);
      return count;
      
    }

    Future<int> delete(int id) async{
      Database db = await this.database;
      int count = await db.delete('pengawasPemilu', where: 'id = ?', whereArgs: [id]);
      return count;
    }

    Future<List<PengawasPemilu>> getPengawasPemilu() async{
      var pengawasPemiluMapList = await select();
      int count = pengawasPemiluMapList.length;
      List<PengawasPemilu> pengawasPemiluList = <PengawasPemilu>[];

      for(int i = 0; i < count; i++){
        pengawasPemiluList.add(PengawasPemilu.fromMap(pengawasPemiluMapList[i]));
      }
      return pengawasPemiluList;
    }


}