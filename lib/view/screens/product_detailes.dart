import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
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
    Get.put(CartPageControllerImpl());

    return GetBuilder<ProductDetailesControllerImpl>(
      builder: (productDetailscontroller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.primaryColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeaderSection(controller: productDetailscontroller),
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
                        // const Spacer(),
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
                  GetBuilder<CartPageControllerImpl>(
                    builder: (controller) {
                      return CustomButton(
                        backgroundColor: const Color(0xff9775FA),
                        width: Dimensions.getWidth(context) * .9,
                        height: Dimensions.getHeight(context) * .06,
                        onPressed: () {
                          productDetailscontroller.addProductToDatabase(
                              productDetailscontroller.product);
                          controller.getOrderdProducts();
                        },
                        buttonName: '58'.tr,
                      );
                    },
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
