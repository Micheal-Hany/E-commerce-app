import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/core/function/translate_database.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:get/get.dart';


class CustomItemStyle extends StatelessWidget {
  const CustomItemStyle({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                // color: const Color(0xff8F959E),

                borderRadius: BorderRadius.circular(15),
              ),
              width: Dimensions.getWidth(context) * 0.42,
              height: Dimensions.getHeight(context) * 0.25,
              // width: 160,
              // height: 203,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: "${product.itemId}",
                    child: CachedNetworkImage(
                      imageUrl: product.itemImage!,
                      fit: BoxFit.fill,
                      placeholder: (context, url) {
                        return Lottie.asset('assets/lattio/loading.json',
                            width: 45, height: 45);
                      },
                    ),
                  )),
            ),
            Container(
              constraints:
                  BoxConstraints(maxWidth: Dimensions.getWidth(context) * 0.39),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.getWidth(context) * .009),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: Get.height / 20,
                    maxWidth: Get.width / 2.2,
                  ),
                  child: Text(
                    translateDataBase(product.itemNameAr, product.itemNameEn!),
                    style: context.bodySmall!.copyWith(fontSize: 15),
                  ),
                ),
              ),
            ),
            Text('\$${product.itemPrice}',
                style: context.bodySmall!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w500)),
          ]),
    );
  }
}
