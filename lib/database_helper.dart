import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_movie/models/news.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('news.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE news(
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  author TEXT NOT NULL,
  date TEXT NOT NULL,
  image TEXT NOT NULL
)
''');
  }

  Future<List<News>> getNews() async {
    final db = await instance.database;
    final newsList = await db.query('news');

    return newsList.map((json) => News.fromJson(json)).toList();
  }

  Future<void> insertNews(News news) async {
    final db = await instance.database;
    await db.insert('news', news.toJson() as Map<String, dynamic>, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateNews(News news) async {
    final db = await instance.database;
    await db.update('news', news.toJson() as Map<String, dynamic>, where: 'id = ?', whereArgs: [news.id]);
  }

  Future<void> deleteNews(String id) async {
    final db = await instance.database;
    await db.delete('news', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
