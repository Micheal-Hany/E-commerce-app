import 'package:flutter/material.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:get/get.dart';
import 'package:store_app/core/function/translate_database.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/Product_page/Product_price.dart';
import 'package:store_app/view/widgets/Product_page/User_review.dart';
import 'package:store_app/view/widgets/Product_page/decription_section.dart';
import 'package:store_app/view/widgets/Product_page/header_section.dart';
import 'package:store_app/view/widgets/Product_page/product_cat_name.dart';
import 'package:store_app/view/widgets/Product_page/review_section.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailesControllerImpl());

    return GetBuilder<ProductDetailesControllerImpl>(
      builder: (productDetailscontroller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: context.myTheme.scaffoldBackgroundColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeaderSection(
                      productDetailesControllerImpl: productDetailscontroller),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductCategoryAndName(
                            category: translateDataBase(
                                productDetailscontroller
                                    .product.categoriesNameAr,
                                productDetailscontroller
                                    .product.categoriesNameEn!),
                            productName: translateDataBase(
                                productDetailscontroller.product.itemNameAr,
                                productDetailscontroller.product.itemNameEn!)),
                        ProductPrice(
                            price:
                                "${productDetailscontroller.product.itemPrice!}"),
                      ],
                    ),
                  ),
                  DescriptionSection(
                    description: translateDataBase(
                        productDetailscontroller.product.itemDecriptionAr,
                        productDetailscontroller.product.itemDecriptionEn!),
                  ),
                  ReviewsSection(
                      onPressed: () =>
                          productDetailscontroller.goToReviewPage()),
                  const CustomUserReview(),
                  const SizedBox(height: 40),
                  CustomButton(
                    backgroundColor: const Color(0xff9775FA),
                    width: Dimensions.getWidth(context) * .9,
                    height: Dimensions.getHeight(context) * .06,
                    onPressed: () {
                      productDetailscontroller.addProductToDatabase(
                          productDetailscontroller.product);
                    },
                    buttonName: '58'.tr,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
