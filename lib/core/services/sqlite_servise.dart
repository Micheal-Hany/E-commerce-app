import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:store_app/core/class/card_model.dart';
import 'package:store_app/data/model/address_model.dart';
import 'package:store_app/data/model/order_model.dart';
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
    await _createOrdefrTable(db, "orders");
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

  Future<void> _createOrdefrTable(Database db, String tableName) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        address TEXT,
        deliveryPrice REAL,
        totalPrice REAL,
        orderDateTime TEXT,
        items TEXT,
        cartNumber TEXT 
      )
    ''');
  }

  Future<void> insertOrder(OrderModel order) async {
    final db = await database;
    await db.insert("orders", order.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<OrderModel>> getOrders() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query("orders");
    return List.generate(maps.length, (i) {
      final List<dynamic> itemsList =
          jsonDecode(maps[i]['items']); // Parse JSON string into a list of maps
      final List<ProductModel> products = itemsList
          .map((item) => ProductModel.fromJson(item))
          .toList(); // Convert maps into ProductModel objects
      return OrderModel(
        cartNumber: maps[i]["cartNumber"],
        address: maps[i]['address'],
        deliveryPrice: maps[i]['deliveryPrice'],
        totalPrice: maps[i]['totalPrice'],
        orderDateTime: DateTime.parse(maps[i]['orderDateTime']),
        items: products, // Assign the list of ProductModel objects to items
      );
    });
  }

  Future<void> deleteAllRows(String tableName) async {
    final db = await database;
    await db.rawDelete('DELETE FROM $tableName');
  }

  Future<void> deleteOrder(int id) async {
    final Database db = await database;
    await db.delete(
      "orders",
      where: 'id = ?',
      whereArgs: [id],
    );
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

  Future<AddressModel?> getAddressById(int itemId, String tableName) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [itemId],
    );

    if (result.isNotEmpty) {
      return AddressModel.fromJson(result.first);
    } else {
      return null;
    }
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

  Future<OrderModel?> getOrderContainingItem(String itemId) async {
    final db = await database;
    final List<Map<String, dynamic>> orders = await db.query('orders');

    
    bool itemFound = false;

    for (final orderMap in orders) {
      final List<dynamic> itemsJson = json.decode(orderMap['items']);
      final List<ProductModel> items =
          itemsJson.map((item) => ProductModel.fromJson(item)).toList();

      for (final item in items) {
        if (item.itemId == itemId) {
      
          itemFound = true;
          return OrderModel.fromMap(orderMap);
        }
      }
      // Check if the item is found before proceeding to the next order
      if (itemFound) {
        break;
      }
    }
    return null;
  }
}
