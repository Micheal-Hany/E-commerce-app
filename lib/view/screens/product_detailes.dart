import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:get/get.dart';
import 'package:store_app/core/function/translate_database.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/Product_page/Product_item_counter.dart';
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
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.primaryColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeaderSection(controller: controller),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductCategoryAndName(
                            category: translateDataBase(
                                controller.product.categoriesNameAr,
                                controller.product.categoriesNameEn!),
                            productName: translateDataBase(
                                controller.product.itemNameAr,
                                controller.product.itemNameEn!)),
                        // const Spacer(),
                        ProductPrice(price: "${controller.product.itemPrice!}"),
                      ],
                    ),
                  ),
                  DescriptionSection(
                    description: translateDataBase(
                        controller.product.itemDecriptionAr,
                        controller.product.itemDecriptionEn!),
                  ),
                  ProductItemCounter(controller: controller),
                  ReviewsSection(onPressed: () => controller.goToReviewPage()),
                  const CustomUserReview(),
                  const SizedBox(height: 40),
                  CustomButton(
                    backgroundColor: const Color(0xff9775FA),
                    width: Dimensions.getWidth(context) * .9,
                    height: Dimensions.getHeight(context) * .06,
                    onPressed: () {},
                    buttonName: '58'.tr,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}




// class ProductInfoSection extends StatelessWidget {
//   const ProductInfoSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Row(
//         children: [
//           ProductCategoryAndName(),
//           Spacer(),
//           ProductPrice(),
//         ],
//       ),
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   const CustomButton(
//       {super.key, required this.buttonName, required this.onPressed});
//   final String buttonName;
//   final void Function()? onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
     
//       decoration: const BoxDecoration(
//           color: Color(0xff9775FA),
//           borderRadius: BorderRadius.all(Radius.circular(15))),
//       child: TextButton(
//         onPressed: onPressed,
//         child: Text(
//           buttonName,
//           style: CustomStyle.textStyle17.copyWith(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }


