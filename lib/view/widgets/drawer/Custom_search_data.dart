import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';

import 'package:store_app/data/model/product_model.dart';

import 'package:store_app/view/widgets/Home/Custom_product_stack.dart';

class CustomSearchData extends StatelessWidget {
  const CustomSearchData(
      {super.key, required this.searchProducts, required this.controller});
  final List<ProductModel> searchProducts;
  final HomeControllerImpl controller;

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
          itemCount: searchProducts.length,
          itemBuilder: (context, index) {
            return Center(
                child: CustomItemStack(
              product: searchProducts[index],
            ));
          },
        ),
        statusRequest: controller.stateRequest);
  }
}
