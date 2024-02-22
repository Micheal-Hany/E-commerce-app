
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/view/widgets/cart/Custom_cart_item_product.dart';

class CartProductsListView extends StatelessWidget {
  const CartProductsListView({
    super.key,
    required this.controller,
  });
  final CartPageControllerImpl controller;
  @override
  Widget build(BuildContext context) {
    return ViewDataHandleing(
        statusRequest: controller.stateRequest,
        widget: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomCartItemDetails(
                product: controller.products[index],
                controller: controller,
              ),
            );
          },
        ));
  }
}
