import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/core/function/translate_database.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/view/widgets/cart/Product_item_counter.dart';

class CustomCartItemDetails extends StatelessWidget {
  const CustomCartItemDetails({
    Key? key,
    required this.controller,
    required this.product,
  }) : super(key: key);
  final CartPageControllerImpl controller;
  final ProductModel product;

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
                tag: product.itemId.toString(),
                child: CachedNetworkImage(
                  imageUrl: product.itemImage!,
                  fit: BoxFit.fill,
                  placeholder: (context, url) {
                    return Lottie.asset('assets/lattio/loading.json',
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
                    translateDataBase(product.itemNameAr, product.itemNameEn!),
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
                  "\$${product.itemPrice} (-\$4.00 Tax)",
                  style: CustomStyle.textStyle11.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: Dimensions.getHeight(context) * .02,
                ),
                ProductItemCounter(
                  controller: controller,
                  product: product,
                ),
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
