import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/translate_database.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/view/widgets/Product_page/add_to_cart_button.dart';
import 'package:store_app/view/widgets/Product_page/decription_section.dart';
import 'package:store_app/view/widgets/Product_page/header_section.dart';
import 'package:store_app/view/widgets/Product_page/product_info.dart';
import 'package:store_app/view/widgets/Product_page/reviews_section-poduct_page.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ProductDetailesControllerImpl>();
    return GetBuilder<ProductDetailesControllerImpl>(
      builder: (controller) {
        ProductModel productModel = controller.getProductModel();
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomButton(
                controller: controller, productModel: productModel),
            backgroundColor: context.myTheme.scaffoldBackgroundColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                 HeaderSection(productDetailesControllerImpl: controller),
                  ProductInfo(productModel: productModel),
                  DescriptionSection(description: translateDataBase(
                          productModel.itemDecriptionAr,
                          productModel.itemDecriptionEn!)),
                  
                  ReviewsSectionProductPage(controller: controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


