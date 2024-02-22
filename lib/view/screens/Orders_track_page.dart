import 'package:flutter/material.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/view/widgets/order_track_page/BottomNavigationBarWidget.dart';
import 'package:store_app/view/widgets/order_track_page/CusotmOrderAppBar.dart';
import 'package:store_app/view/widgets/order_track_page/OrderListWidget.dart';
import 'package:get/get.dart';

class OrderTrackPage extends StatelessWidget {
  const OrderTrackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 Get.find<OrderTrackController>();

    return GetBuilder<OrderTrackController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar:
              BottomNavigationBarWidget(controller: controller),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),
                CusotmOrderAppBar(controller: controller),
                ViewDataHandleing(
                  widget: OrderListWidget(controller: controller),
                  statusRequest: controller.statusRequest,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
