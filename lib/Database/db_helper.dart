import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  //open database
  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'study.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE subjects(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            time TEXT,
          )
        ''');
      },
    );
  }

  //insertion
  static Future<int> insertSubject(String name, String time) async {
    final db = await database;
    return await db.insert('subjects', {'name': name, 'time': time});
  }

  //fetching
  static Future<List<Map<String, dynamic>>> getsubjects() async {
    final db = await database;
    return await db.query('subjects');
  }

  //deletion
  static Future<int> deleteSubject(int id) async {
    final db = await database;
    return await db.delete('subjects', where: 'id=?', whereArgs: [id]);
  }
}
