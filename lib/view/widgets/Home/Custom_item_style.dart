import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/data/model/product_model.dart';

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
                borderRadius: BorderRadius.circular(15),
              ),
              width: Dimensions.getWidth(context) * 0.38,
              height: Dimensions.getHeight(context) * 0.25,
              // width: 160,
              // height: 203,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: product.itemImage!,
                    fit: BoxFit.fill,
                    placeholder: (context, url) {
                      return Lottie.asset('assets/lattio/loading.json',
                          width: 50, height: 50);
                    },
                  )),
            ),
            Container(
              constraints:
                  BoxConstraints(maxWidth: Dimensions.getWidth(context) * 0.39),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.getWidth(context) * .009),
                child: Text(
                  product.itemNameEn!,
                  style: CustomStyle.textStyle15.copyWith(color: Colors.black),
                ),
              ),
            ),
            Text(
              '\$${product.itemPrice}',
              style: CustomStyle.textStyle13.copyWith(color: Colors.black),
            ),
          ]),
    );
  }
}
