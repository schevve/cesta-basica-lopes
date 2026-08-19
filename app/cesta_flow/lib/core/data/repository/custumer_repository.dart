import 'package:cesta_flow/core/data/local/db_helper.dart';
import 'package:cesta_flow/core/data/model/custumer_model.dart';
import 'package:sqflite/sqflite.dart';

class CustumerRepository {
  final DatabaseHelper _dbHelper;

  CustumerRepository({DatabaseHelper? dbHelper})
    : _dbHelper = dbHelper ?? DatabaseHelper();

  Future<int> registerCustumer(Custumer custumer) async {
    final db = await _dbHelper.database;
    return await db.insert(
      'costumers',
      custumer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Custumer?> getCustumerById(int id) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'costumers',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Custumer.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Custumer>> getAllCustumers() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('costumers');
    return maps.map((map) => Custumer.fromMap(map)).toList();
  }

  Future<int> updateCustumer(Custumer custumer) async {
    if (custumer.id == null) {
      throw ArgumentError('Custumer id cannot be null when updating.');
    }
    final db = await _dbHelper.database;
    return await db.update(
      'costumers',
      custumer.toMap(),
      where: 'id = ?',
      whereArgs: [custumer.id],
    );
  }

  Future<int> deleteCustumer(int id) async {
    final db = await _dbHelper.database;
    return await db.delete('costumers', where: 'id = ?', whereArgs: [id]);
  }
}
