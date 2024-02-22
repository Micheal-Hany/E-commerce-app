
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Category_title.dart';
import 'package:store_app/view/widgets/Home/Custom_category_listview.dart';
import 'package:store_app/view/widgets/Home/custom_product_grid_view.dart';

class BodyContent extends StatelessWidget {
  final HomeControllerImpl controller;

  const BodyContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.getWidth(context) * .03,
            ),
            child: CustomCategoryTitle(onTap: () {}),
          ),
          SizedBox(height: Dimensions.getWidth(context) * .03),
          const SizedBox(
            height: 40,
            width: double.infinity,
            child: ViewDataHandleingRequest(
              widget: CustomCategorylistView(),
              statusRequest: StatusRequest.success,
            ),
          ),
          const CustomProductCridView(),
        ],
      ),
    );
  }
}
