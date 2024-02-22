import 'dart:convert';

import 'package:store_app/data/model/product_model.dart';

class OrderModel {
  final String cartNumber;
  final String address;
  final double deliveryPrice;
  final double totalPrice;
  final DateTime orderDateTime;
  final List<ProductModel> items;

  OrderModel({
    required this.cartNumber,
    required this.address,
    required this.deliveryPrice,
    required this.totalPrice,
    required this.orderDateTime,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'deliveryPrice': deliveryPrice,
      'totalPrice': totalPrice,
      'orderDateTime': orderDateTime.toIso8601String(),
      'items': jsonEncode(items.map((item) => item.toJson()).toList()),
      'cartNumber': cartNumber,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      cartNumber: map['cartNumber'],
      address: map['address'],
      deliveryPrice: map['deliveryPrice'],
      totalPrice: map['totalPrice'],
      orderDateTime: DateTime.parse(map['orderDateTime']),
      items: List<ProductModel>.from(
        map['items'].map((item) => ProductModel.fromJson(item)),
      ),
    );
  }
}
