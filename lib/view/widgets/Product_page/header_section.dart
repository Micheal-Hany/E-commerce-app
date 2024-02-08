import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class HeaderSection extends GetView<HaomeScreenContollerImpl> {
  final ProductDetailesControllerImpl productDetailesControllerImpl;

  const HeaderSection({super.key, required this.productDetailesControllerImpl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "${productDetailesControllerImpl.product.itemId}",
          child: Container(
            width: double.infinity,
            height: Dimensions.getHeight(context) * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  productDetailesControllerImpl.product.itemImage!,
                ),
                // fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Row(
            children: [
              CustomCartIcon(
                backgroundColor: const Color(0xffFEFEFE),
                onPressed: () => productDetailesControllerImpl.backToHomePage(),
                widget: const Icon(Icons.arrow_back_rounded),
              ),
              const Spacer(),
              CustomCartIcon(
                backgroundColor: const Color(0xffFEFEFE),
                onPressed: () => controller.changePage(2),
                widget: const Icon(Icons.shopping_bag_rounded),
                // widget: Image.asset(
                //   'assets/images/bag.PNG',
                //   width: Dimensions.getWidth(context) * .078,
                //   height: Dimensions.getHeight(context) * .038,
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
