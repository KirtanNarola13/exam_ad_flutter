import 'dart:developer';

import 'package:exam_ad_flutter/model/cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static DBHelper dbHelper = DBHelper._();

  Database? db;
  String tableName = "card";
  String productId = "id";
  String productName = "name";
  String productPrice = "price";

  Future<void> initDB() async {
    String dbLocation = await getDatabasesPath();
    String path = join(dbLocation, "product.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        String query =
            "CREATE TABLE $tableName($productId INTEGER PRIMARY KEY AUTOINCREMENT, $productName TEXT NOT NULL, $productPrice TEXT NOT NULL);";
        await db.execute(query).then((value) {
          log("$tableName created");
        }).onError((error, _) {
          log("ERROR : $error");
        });
      },
    );
  }

  Future<int> addToCart({required String name, required String price}) async {
    await initDB();

    Map<String, dynamic> data = {
      productName: name,
      productPrice: price,
    };

    return await db!.insert(
      tableName,
      data,
    );
  }

  Future<List<CartModel>> getMyTasks() async {
    await initDB();
    String query = "SELECT * FROM $tableName;";

    List<Map<String, dynamic>> data = await db!.rawQuery(query);

    return data.map((e) => CartModel.fromDB(data: e)).toList();
  }

  Future<int> deleteProduct({required String title}) async {
    await initDB();
    return await db!.delete(
      tableName,
      where: "$productName = ?",
      whereArgs: [title],
    );
  }
}
