import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_app_bar.dart';
import 'package:store_app/view/widgets/Home/Custom_searsh_bar.dart';

class SilverAppBarContent extends StatelessWidget {
  final HomeControllerImpl controller;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SilverAppBarContent(
      {super.key, required this.controller, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: const <Widget>[],
      expandedHeight: Dimensions.getHeight(context) * .25,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(
          horizontal: Dimensions.getWidth(context) * .03,
        ),
        expandedTitleScale: 1.0,
        centerTitle: true,
        title: SizedBox(
          height: Dimensions.getWidth(context) * .12,
          child: CustomSearchBar(controller: controller),
        ),
        background: Column(
          children: [
            SizedBox(height: Dimensions.getHeight(context) * .05),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.getWidth(context) * .02,
              ),
              child: CustomHomeAppBar(scaffoldKey: scaffoldKey),
            ),
            SizedBox(height: Dimensions.getHeight(context) * .02),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.getWidth(context) * .04,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('53'.tr, style: context.headlineLarge),
                      Text('54'.tr,
                          style: context.bodyMedium
                              ?.copyWith(color: ColorConstant.manatee)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.getHeight(context) * .03),
          ],
        ),
      ),
    );
  }
}
