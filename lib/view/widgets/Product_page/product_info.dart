
import 'package:flutter/material.dart';
import 'package:store_app/core/function/translate_database.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/view/widgets/Product_page/Product_price.dart';
import 'package:store_app/view/widgets/Product_page/product_cat_name.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel productModel;

  const ProductInfo({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductCategoryAndName(
              category: translateDataBase(
                  productModel.categoriesNameAr, productModel.categoriesNameEn),
              productName: translateDataBase(productModel.itemNameAr ?? "",
                  productModel.itemNameEn ?? "")),
          ProductPrice(price: "${productModel.itemPrice!}"),
        ],
      ),
    );
  }
}

 