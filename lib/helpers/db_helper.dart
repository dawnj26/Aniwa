import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  static String databaseName = 'animes.db';
  static int databaseVersion = 3;
  static String tableName = 'anime';
  static String columnAnimeId = 'anime_id';
  static String columnTitle = 'anime_title';
  static String columnCategory = 'category';
  static String columnCoverImage = 'cover_image';
  static String columnEpisodes = 'total_episodes';
  static String columnCurrentEpisode = 'current_episode';
  static String columnStartDate = 'start_date';
  static String columnEndDate = 'end_date';

  static Future<Database> openDB() async {
    String path = join(await getDatabasesPath(), databaseName);
    String sql =
        'CREATE TABLE IF NOT EXISTS $tableName($columnAnimeId INTEGER PRIMARY KEY, $columnTitle TEXT ,$columnCategory TEXT, $columnCoverImage TEXT,$columnCurrentEpisode INTEGER DEFAULT 0, $columnEpisodes INTEGER, $columnStartDate DATE DEFAULT CURRENT_DATE, $columnEndDate DATE DEFAULT CURRENT_DATE)';
    return await openDatabase(path, version: databaseVersion,
        onCreate: (db, version) {
      db.execute(
        sql,
      );
    }, onUpgrade: (db, oldVersion, newVersion) {
      if (newVersion <= oldVersion) return;
      db.execute('DROP TABLE IF EXISTS $tableName');
      db.execute(
        sql,
      );
    });
  }

  static Future<int> insert(Map<String, dynamic> row) async {
    Database db = await openDB();
    return await db.insert(tableName, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> update(Map<String, dynamic> row) async {
    Database db = await openDB();
    return await db.update(tableName, row,
        where: '$columnAnimeId = ?', whereArgs: [row[columnAnimeId]]);
  }

  static Future<int> delete(int id) async {
    Database db = await openDB();
    return await db
        .delete(tableName, where: '$columnAnimeId = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await openDB();
    var result = await db.query(tableName);

    return result;
  }

  static Future<List<Map<String, dynamic>>> queryCategory(String cat) async {
    Database db = await openDB();
    var result = await db
        .query(tableName, where: '$columnCategory = ?', whereArgs: [cat]);

    return result;
  }
}
