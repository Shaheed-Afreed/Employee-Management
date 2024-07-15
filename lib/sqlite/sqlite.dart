import 'dart:async';
import 'package:main_project/Models/Employee.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// database helper class for register and Login
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;
  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('users', row);
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }
}
// database helper class for adding team
class DatabaseTeam {
  static final DatabaseTeam _instance = DatabaseTeam._internal();
  static Database? _database;

  factory DatabaseTeam() {
    return _instance;
  }

  DatabaseTeam._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
  // database created
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'team_database_system_1.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  // to create table on database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
       CREATE TABLE team_members (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      role TEXT NOT NULL,
      gender TEXT NOT NULL,
      dateOfBirth TEXT NOT NULL
      )
    ''');
  }
  //Employee data is inserted into table team_members
  Future<int> insertTeamMember(Employee member) async {
    Database db = await database;
    return await db.insert('team_members', member.toMap());
  }

  // fetch all the data from the 'table' team_members
  Future<List<Employee>> getTeamMembers() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('team_members');
    return List.generate(maps.length, (i) {
      return Employee.fromMap(maps[i]);
    });
  }
 
}



