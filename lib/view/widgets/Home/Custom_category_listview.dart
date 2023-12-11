import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/view/widgets/Home/Custom_category_Item.dart';
import 'package:get/get.dart';

class CustomCategorylistView extends StatelessWidget {
  const CustomCategorylistView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());

    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => Scaffold(
        body: ViewDataHandleingRequest(
          statusRequest: controller.stateRequest,
          widget: TabBar(
            automaticIndicatorColorAdjustment: true,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelColor: AppColor.primaryColorDart,
            dividerColor: Colors.black,
            controller: controller.tabController,
            isScrollable: true,
            tabs: controller.categories
                .map(
                  (category) => Tab(
                    child: CustomCategoryItem(
                      categoryName: "${category.categoriesNameEn}",
                      image: "${category.categoriesImage}",
                    ),
                  ),
                )
                .toList(),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(),
            labelStyle: CustomStyle.textStyle22.copyWith(fontSize: 15),
            unselectedLabelStyle: CustomStyle.textStyle15,
            onTap: (index) {
              controller
                  .getItemsData("${controller.categories[index].categoriesId}");
              print("${controller.categories[index].categoriesId}");
            },
          ),
        ),
      ),
    );
  }
}
