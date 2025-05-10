import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_zarzal/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database? _database;
  static final DbProvider db = DbProvider._();

  DbProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database?> initDB() async {
    // path donde vamos a almacenar la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // creacion de la base de datos
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    // crear la tabla
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
            CREATE TABLE Scans(
              id INTEGER PRIMARY KEY,
              tipo TEXT,
              valor TEXT
            )
          ''');
    });
  }

  Future<int?> nuevoScanRaw(ScanModel nuevoScan) async {
    // extraer los valores
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    // verificar la base de datos
    final db = await database;
    final res = await db?.rawInsert('''
      insert into Scans(id, tipo, valor) 
      values(${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}')
    ''');
    return res;
  }

  Future<int?> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db?.insert('Scans', nuevoScan.toJson());
    return res;
  }
}
