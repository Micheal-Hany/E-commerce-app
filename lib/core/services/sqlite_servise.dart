import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:store_app/data/model/product_model.dart';

class DBHelper {
  List<ProductModel> products = [];
  static DBHelper? _instance;
  late Database _database;

  DBHelper._();

  factory DBHelper.instance() {
    _instance ??= DBHelper._();
    return _instance!;
  }

  Future<Database> get database async {
    if (!_database.isOpen) {
      await initDatabase();
    }
    return _database;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'ecommerce.db');
    // await deleteDatabase(join(path, 'ecommerce.db'));
    _database = await openDatabase(path, version: 1, onCreate: _createTable);
    return _database;
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Liked_Products (
      item_id INTEGER PRIMARY KEY AUTOINCREMENT,
      item_name_en TEXT,
      item_name_ar TEXT,
      item_decription_ar TEXT,
      item_decription_en TEXT,
      item_image TEXT,
      item_count INTEGER,
      item_discount INTEGER,
      item_price INTEGER,
      item_date TEXT,
      item_active INTEGER,
      item_category INTEGER,
      categories_id INTEGER,
      categories_name_ar TEXT,
      categories_name_en TEXT,
      categories_image TEXT,
      categories_datetime TEXT
    )
  ''');
  }

  Future<int> insertLikedProduct(ProductModel product) async {
    final db = await database;
    return await db.insert('Liked_Products', product.toJson());
  }

  Future<List<ProductModel>> getAllLikedProducts(String tableName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return ProductModel.fromJson(maps[index]);
    });
  }

  Future<ProductModel?> getProductById(int itemId) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'Liked_Products',
      where: 'item_id = ?',
      whereArgs: [itemId],
    );

    if (result.isNotEmpty) {
      return ProductModel.fromJson(result.first);
    } else {
      return null;
    }
  }

  // Future<int> updateLikedProduct(ProductModel product) async {
  //   final db = await database;
  //   return await db.update(
  //     'Liked_Products',
  //     product.toJson(),
  //     where: 'item_id = ?',
  //     whereArgs: [product.itemId],
  //   );
  // }
}
