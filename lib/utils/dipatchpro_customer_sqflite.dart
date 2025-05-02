import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DispatchProCustomerDB {
  static final DispatchProCustomerDB _instance = DispatchProCustomerDB._internal();
  factory DispatchProCustomerDB() => _instance;

  static Database? _database;

  DispatchProCustomerDB._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'dispatchpro_customer.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE recent_searches (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            address TEXT,
            lat REAL,
            lng REAL
          )
        ''');
      },
    );
  }

  Future<void> addRecentSearch(String address, double lat, double lng) async {
    final db = await database;
    await db.insert(
      'recent_searches',
      {'address': address, 'lat': lat, 'lng': lng},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getRecentSearches() async {
    final db = await database;
    return db.query('recent_searches', orderBy: 'id DESC');
  }

  Future<void> clearRecentSearches() async {
    final db = await database;
    await db.delete('recent_searches');
  }
}
