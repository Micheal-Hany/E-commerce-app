import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/view/widgets/Home/Custom_item_style.dart';
import 'package:get/get.dart';

class CustomItemStack extends StatelessWidget {
  const CustomItemStack({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Get.find<HomeControllerImpl>();
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) {
        bool isFavoraite = controller.isProductFavoraite(product);
        return Stack(
          children: [
            GestureDetector(
              onTap: () async {
                controller.goToProductDetailes(product);
              },
              child: CustomItemStyle(
                product: product,
              ),
            ),
            Positioned(
              top: Dimensions.getHeight(context) * .025,
              left: Dimensions.getHeight(context) * .18,
              child: GestureDetector(
                onTap: () {
                  isFavoraite
                      ? controller.remove(product)
                      : controller.addProductToDatabase(product);

                  controller.favProduct(product);
                },
                child: isFavoraite
                    ? Image.asset(
                        'assets/images/love_red.png',
                        width: 25,
                        height: 25,
                      )
                    : Image.asset(
                        'assets/images/heart.png',
                        width: 25,
                        height: 25,
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
