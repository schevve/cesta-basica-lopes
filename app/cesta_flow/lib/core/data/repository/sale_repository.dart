import 'package:cesta_flow/core/data/local/db_helper.dart';
import 'package:cesta_flow/core/data/model/sale_model.dart';
import 'package:sqflite/sqflite.dart';

class SaleRepository {
  final DatabaseHelper _dbHelper;

  SaleRepository({DatabaseHelper? dbHelper})
    : _dbHelper = dbHelper ?? DatabaseHelper();

  Future<int> registerSale(Sale sale) async {
    final db = await _dbHelper.database;
    return await db.insert(
      'sales',
      sale.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Sale?> getSaleById(int id) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'sales',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Sale.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Sale>> getSalesBycustumerId(int custumerId) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'sales',
      where: 'custumer_id = ?',
      whereArgs: [custumerId],
    );
    return maps.map((map) => Sale.fromMap(map)).toList();
  }

  Future<List<Sale>> getAllSales() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('sales');
    return maps.map((map) => Sale.fromMap(map)).toList();
  }

  Future<int> updateSale(Sale sale) async {
    if (sale.id == null) {
      throw ArgumentError('Sale id cannot be null when updating.');
    }
    final db = await _dbHelper.database;
    return await db.update(
      'sales',
      sale.toMap(),
      where: 'id = ?',
      whereArgs: [sale.id],
    );
  }

  Future<int> deleteSale(int id) async {
    final db = await _dbHelper.database;
    return await db.delete('sales', where: 'id = ?', whereArgs: [id]);
  }
}
