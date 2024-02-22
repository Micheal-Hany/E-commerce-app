import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/view/widgets/Home/Custom_product_stack.dart';
import 'package:store_app/view/widgets/drawer/Custom_search_data.dart';
import 'package:get/get.dart';

class CustomProductCridView extends StatelessWidget {
  const CustomProductCridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) {
        return !controller.isSearch
            ? ViewDataHandleing(
                widget: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .75,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: CustomItemStack(
                        product: controller.products[index],
                      ),
                    );
                  },
                ),
                statusRequest: controller.stateRequest,
              )
            : CustomSearchData(
                controller: controller,
                searchProducts: controller.searchProducts,
              );
      },
    );
  }
}
