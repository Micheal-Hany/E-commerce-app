import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/favorite_page_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_product_stack.dart';
import 'package:store_app/view/widgets/favorite_page/CustomFavoriteAppBar.dart';
import 'package:get/get.dart';

class FavoraitePage extends StatelessWidget {
  const FavoraitePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImpl());
    return Scaffold(body: GetBuilder<FavoriteControllerImpl>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.getWidth(context) * .02),
                  child: const CustomFavoriteAppBar(),
                ),
                ViewDataHandleing(
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .75,
                      crossAxisCount: 2,
                    ),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: CustomItemFDavoriteStack(
                          product: controller.products[index],
                        ),
                      );
                    },
                  ),
                  statusRequest: controller.stateRequest,
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
