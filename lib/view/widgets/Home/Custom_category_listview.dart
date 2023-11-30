import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
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
        body: controller.stateRequest == StatusRequest.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.stateRequest == StatusRequest.failure
                ? const Center(
                    child: Text('Failed to fetch data'),
                  )
                : TabBar(
                    automaticIndicatorColorAdjustment: true,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    labelColor: AppColor.primaryColorDart,
                    dividerColor: Colors.black,
                    controller: controller.tabController,
                    isScrollable: true,
                    tabs: controller.categories
                        .asMap()
                        .entries
                        .map(
                          (entry) => Tab(
                            child: CustomCategoryItem(
                              categoryName:
                                  "${controller.categories[entry.key].categoriesNameEn}",
                              image:
                                  "${controller.categories[entry.key].categoriesImage}",
                            ),
                          ),
                        )
                        .toList(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const BoxDecoration(),
                    labelStyle: CustomStyle.textStyle22.copyWith(fontSize: 15),
                    unselectedLabelStyle: CustomStyle.textStyle15,
                  ),
      ),
    );
  }
}
