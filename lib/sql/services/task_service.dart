import 'package:path/path.dart';
import 'package:practicee/sql/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TaskService {
  TaskService._privateConstructor();
  static final TaskService instance = TaskService._privateConstructor();

  static Database? _database;

  // Proper Getter
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Init DB
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "tasks.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Create Table
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        isDone INTEGER NOT NULL
      )
    ''');
  }

  // Get All Tasks (FIXED)
  Future<List<Task>> getAllTasks() async {
    final db = await database;

    final List<Map<String, dynamic>> data =
        await db.query("tasks", orderBy: "id DESC");

    return List.generate(
      data.length,
      (i) => Task.fromMap(data[i]),
    );
  }

  // Insert Task (FIXED)
  Future<int> insertTask(Task task) async {
    final db = await database;

    return await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  // Update Task (FIXED)
  Future<int> updateTask(Task task) async {
    final db = await database;

    return await db.update(
      'tasks',
      {
        'title': task.title,
        'isDone': task.isDone ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  // Delete Task (FIXED)
  Future<int> deleteTask(int id) async {
    final db = await database;

    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
