import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class HeaderSection extends StatelessWidget {
  final ProductDetailesControllerImpl productDetailesControllerImpl;

  const HeaderSection({super.key, required this.productDetailesControllerImpl});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HaomeScreenContollerImpl>();
    return Stack(
      children: [
        Hero(
          tag: "${productDetailesControllerImpl.getProductModel().itemId}",
          child: Container(
            width: double.infinity,
            height: Dimensions.getHeight(context) * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  productDetailesControllerImpl.getProductModel().itemImage ??
                      "",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Row(
            children: [
              CustomCartIcon(
                backgroundColor: context.myTheme.cardColor,
                onPressed: () => productDetailesControllerImpl.backToHomePage(),
                widget: const Icon(Icons.arrow_back_rounded),
              ),
              const Spacer(),
              CustomCartIcon(
                backgroundColor: context.myTheme.cardColor,
                onPressed: () {
                  Get.back();
                  controller.changePage(2);
                },
                widget: const Icon(Icons.shopping_bag_rounded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
