import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/cart/Product_item_counter.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartPageControllerImpl());
    return Scaffold(body: GetBuilder<CartPageControllerImpl>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.getWidth(context) * .02, vertical: 40),
          child: Column(
            children: [
              const CustomCartAppBar(),
              const SizedBox(
                height: 20,
              ),
              CustomCartItemDetails(
                controller: controller,
              )
            ],
          ),
        );
      },
    ));
  }
}

class CustomCartItemDetails extends StatelessWidget {
  const CustomCartItemDetails({Key? key, required this.controller})
      : super(key: key);
  final CartPageControllerImpl controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF5F6FA),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: " ",
                child: CachedNetworkImage(
                  imageUrl:
                      "https://assets.hermes.com/is/image/hermesproduct/h-embroidered-t-shirt--072025HA01-worn-1-0-0-1000-1000_g.jpg",
                  fit: BoxFit.fill,
                  placeholder: (context, url) {
                    return Lottie.asset('assets/lottie/loading.json',
                        width: 45, height: 45);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: Dimensions.getWidth(context) * .6,
                  ),
                  child: Text(
                    "Men's Tie-Dye T-Shirt Nike Sportswear",
                    style: CustomStyle.textStyle15.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
                Text(
                  "\$45 (-\$4.00 Tax)",
                  style: CustomStyle.textStyle11.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: Dimensions.getHeight(context) * .02,
                ),
                ProductItemCounter(controller: controller),
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCartAppBar extends StatelessWidget {
  const CustomCartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: const Color(0xffFEFEFE),
          onPressed: () {},
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        SizedBox(
          width: Dimensions.getWidth(context) / 3.1,
        ),
        Text(
          "66".tr,
          style: CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
