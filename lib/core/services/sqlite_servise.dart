import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:store_app/data/model/address_model.dart';
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

  updateValue(
      String tableName, String columnName, int newValue, int itemId) async {
    final db = await database;
    try {
      await db.update(
        tableName, // Table name
        {columnName: newValue}, // Values to update
        where: 'item_id = ?', // WHERE clause
        whereArgs: [itemId],
      );
    } catch (e) {
      print('Error updating value: $e');
      // Handle error as needed
    }
  }

  Future<void> initDatabase() async {
    String path = join(await getDatabasesPath(), 'ecommerce.db');
    //await deleteDatabase(join(path, 'ecommerce.db'));
    _database = await openDatabase(path, version: 1, onCreate: _createTables);
  }

  Future<void> _createTables(Database db, int version) async {
    await _createProductTable(db, 'Liked_Products');
    await _createProductTable(db, 'Cart_Products');
    await _createAddressTable(db, 'addresses');
    await _createCardTable(db, 'cards');
  }

  Future<void> _createProductTable(Database db, String tableName) async {
    await db.execute('''
    CREATE TABLE $tableName (
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

  Future<void> _createAddressTable(Database db, String tableName) async {
    await db.execute('''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      street TEXT,
      subLocality TEXT,
      locality TEXT,
      postalCode TEXT,
      country TEXT
    )
  ''');
  }

  Future<void> _createCardTable(Database db, String tableName) async {
    await db.execute('''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      cardNumber TEXT,
      expiryDate TEXT,
      cardHolderName TEXT,
      cvvCode TEXT
    )
  ''');
  }

  Future<int> insertProduct(String tableName, ProductModel product) async {
    final db = await database;
    return await db.insert(tableName, product.toJson());
  }

  Future<int> insertCard(String tableName, CardModel card) async {
    final db = await database;
    return await db.insert(tableName, card.toJson());
  }

  Future<int> insertAddress(String tableName, AddressModel addressModel) async {
    final db = await database;
    return await db.insert(tableName, addressModel.toJson());
  }

  Future<int> deleteProduct(String tableName, ProductModel product) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: 'item_id = ?',
      whereArgs: [product.itemId],
    );
  }

  Future<int> deleteCard(String tableName, CardModel card) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [card.id],
    );
  }

  Future<int> deleteAddress(String tableName, AddressModel addressModel) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [addressModel.id],
    );
  }

  Future<List<ProductModel>> getAllProducts(String tableName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return ProductModel.fromJson(maps[index]);
    });
  }

  Future<List<AddressModel>> getAllAddresses(String tableName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return AddressModel.fromJson(maps[index]);
    });
  }

  Future<List<CardModel>> getAllCards(String tableName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return CardModel.fromJson(maps[index]);
    });
  }

  Future<ProductModel?> getProductById(int itemId, String tableName) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: 'item_id = ?',
      whereArgs: [itemId],
    );

    if (result.isNotEmpty) {
      return ProductModel.fromJson(result.first);
    } else {
      return null;
    }
  }
}
