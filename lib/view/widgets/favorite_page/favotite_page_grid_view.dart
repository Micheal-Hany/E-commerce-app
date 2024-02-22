
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/favorite_page_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/view/widgets/favorite_page/CustomItemFDavoriteStack.dart';

class FavoriteProductGrid extends StatelessWidget {
  final FavoriteControllerImpl controller;

  const FavoriteProductGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ViewDataHandleing(
      widget: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
