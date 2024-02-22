
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/favorite_page_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/favorite_page/CustomFavoriteAppBar.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/favorite_page/favotite_page_grid_view.dart';
class FavoritePageContent extends StatelessWidget {
  const FavoritePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteControllerImpl>(
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
                FavoriteProductGrid(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
