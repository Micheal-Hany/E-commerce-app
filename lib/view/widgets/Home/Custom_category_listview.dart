import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/view/widgets/Home/Custom_category_Item.dart';

class CustomCategorylistView extends StatefulWidget {
  CustomCategorylistView({super.key, required this.controllerImpl});
  HomeControllerImpl? controllerImpl;
  @override
  _CustomCategorylistViewState createState() => _CustomCategorylistViewState();
}

class _CustomCategorylistViewState extends State<CustomCategorylistView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: widget.controllerImpl!.categories.length, vsync: this);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController!.removeListener(_handleTabSelection);
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      automaticIndicatorColorAdjustment: true,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      labelColor: AppColor.primaryColorDart,
      controller: _tabController,
      isScrollable: true,
      tabs: widget.controllerImpl!.categories
          .asMap()
          .entries
          .map(
            (entry) => Tab(
              child: CustomCategoryItem(
                categoryName: "${entry.value['categories_name_en']}",
                image: "${entry.value['categories_image']}",
              ),
            ),
          )
          .toList(),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: const BoxDecoration(),
      labelStyle: CustomStyle.textStyle22.copyWith(fontSize: 15),
      unselectedLabelStyle: CustomStyle.textStyle15,
    );
  }
}
