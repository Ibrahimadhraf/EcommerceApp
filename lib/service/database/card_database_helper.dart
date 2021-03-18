import 'package:online_shopping/model/card_product_model.dart';
import 'package:online_shopping/model/category_model.dart';
import 'package:online_shopping/model/product_model.dart';
import 'package:online_shopping/view/helpers/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _dataBase;

  Future<Database> get datatBase async {
    if (_dataBase != null) return _dataBase;
    _dataBase = await initDb();
    return _dataBase;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CardProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {

      await db.execute(''' 
           CREATE TABLE $tableCardProduct (
           $columnName TEXT NOT NULL,
            $columnImage TEXT NOT NULL,
            $columnPrice TEXT NOT NULL,
            $columnQuantity INTEGER NOT NULL ,
              $columnProductId Text NOT NULL)
           ''');
    });
  }
   Future<List<CardProductModel>> getAllProducts()async{
      var dbClient = await datatBase;

      List<Map> maps= await dbClient.query(tableCardProduct);
      List<CardProductModel> list=maps.isNotEmpty?
       maps.map((map) =>  CardProductModel.fromJson(map)).toList():[];
      return list;

}
  inset(CardProductModel model) async {
    var dbClient = await datatBase;
    await dbClient.insert(tableCardProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  updateProduct(CardProductModel model) async{
    var dbClient = await datatBase;
    return await dbClient.update(tableCardProduct, model.toJson(),
      where: '$columnProductId=?',whereArgs: [model.id]
    );

  }
}
