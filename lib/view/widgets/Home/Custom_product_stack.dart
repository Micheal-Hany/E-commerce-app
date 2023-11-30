import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/view/widgets/Home/Custom_item_style.dart';
import 'package:get/get.dart';

class CustomItemStack extends StatelessWidget {
  const CustomItemStack({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.setProduct(product);
            controller.goToProductDetailes();
          },
          child: Stack(
            children: [
              CustomItemStyle(
                product: product,
              ),
              Positioned(
                top: Dimensions.getHeight(context) * .025,
                left: Dimensions.getHeight(context) * .18,
                child: Image.asset(
                  'assets/images/heart.png',
                  width: 25,
                  height: 25,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
