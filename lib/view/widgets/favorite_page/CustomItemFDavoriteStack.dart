import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/favorite_page_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/view/widgets/Home/Custom_item_style.dart';
import 'package:get/get.dart';
class CustomItemFDavoriteStack extends StatelessWidget {
  const CustomItemFDavoriteStack({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteControllerImpl>(
      builder: (controller) {
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
                    controller.remove(product);
                    controller.getLikedProducts();
                  },
                  child: Image.asset(
                    'assets/images/love_red.png',
                    width: 25,
                    height: 25,
                  )),
            ),
          ],
        );
      },
    );
  }
}
