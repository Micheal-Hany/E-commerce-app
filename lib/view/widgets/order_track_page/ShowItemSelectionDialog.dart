import 'package:flutter/material.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/translate_database.dart';
import 'package:store_app/data/model/product_model.dart';

import 'package:get/get.dart';
class ShowItemSelectionDialog extends StatelessWidget {
  final List<ProductModel> items;
  final OrderTrackController controller;

  const ShowItemSelectionDialog({
    super.key,
    required this.items,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.myTheme.cardColor,
      title: Center(
        child: Text(
          '160'.tr,
          style: context.headlineLarge!.copyWith(fontSize: 20),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: items.map((item) {
            return GestureDetector(
              onTap: () => controller.selectItem(item),
              child: ListTile(
                title: Text(
                  translateDataBase(item.itemNameAr, item.itemNameEn) ?? '',
                  style: context.bodyLarge,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

