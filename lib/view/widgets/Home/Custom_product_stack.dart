import 'package:flutter/material.dart';
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
    Get.put(ProductDetailesControllerImpl());
    return GetBuilder<ProductDetailesControllerImpl>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => controller.goToProduct(),
          child: Stack(
            children: [
              CustomItemStyle(
                product: product,
              ),
              Positioned(
                top: Dimensions.getHeight(context) * .018,
                left: Dimensions.getHeight(context) * .195,
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
