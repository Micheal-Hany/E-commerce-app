import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/cart/Custom_cart_item_product.dart';
import 'package:store_app/view/widgets/cart/address_section.dart';
import 'package:store_app/view/widgets/cart/cart_app_bar.dart';
import 'package:store_app/view/widgets/cart/order_info.dart';
import 'package:store_app/view/widgets/cart/payment_section.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      CartPageControllerImpl(),
    );
    return Scaffold(
      body: GetBuilder<CartPageControllerImpl>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.getWidth(context) * .02, vertical: 40),
              child: Column(
                children: [
                  const CustomCartAppBar(),
                  const SizedBox(height: 10),
                  ViewDataHandleing(
                      statusRequest: controller.stateRequest,
                      widget: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          // final product = controller.products[index];
                          // final itemController =
                          //     controller.getItemController(product.itemId!);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomCartItemDetails(
                              product: controller.products[index],
                              controller: controller,
                            ),
                          );
                        },
                      )),
                  const CustomDeliveryAddress(),
                  const CustomPaymentMethod(),
                  const OrderInfoSection(),
                  SizedBox(height: Dimensions.getWidth(context) * .03),
                  CustomButton(
                    buttonName: "73".tr,
                    onPressed: () {},
                    backgroundColor: const Color(0xff9775FA),
                    width: Dimensions.getWidth(context) * .9,
                    height: Dimensions.getHeight(context) * .06,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
