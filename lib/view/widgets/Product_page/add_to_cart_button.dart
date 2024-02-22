import 'package:flutter/material.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:get/get.dart';
class BottomButton extends StatelessWidget {
  final ProductDetailesControllerImpl controller;
  final ProductModel productModel;

  const BottomButton(
      {super.key, required this.controller, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      backgroundColor: const Color(0xff9775FA),
      width: Dimensions.getWidth(context) * .9,
      height: Dimensions.getHeight(context) * .06,
      onPressed: () {
        controller.addProductToDatabase(productModel);
      },
      buttonName: '58'.tr,
    );
  }
}
