import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/colors.dart';

class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: context.theme.cardColor,
        child: TextField(
          controller: controller.searchController,
          onChanged: (val) => controller.checkSearch(val),
          cursorHeight: 25,
          maxLines: 1,
          decoration: InputDecoration(
            fillColor: context.theme.cardColor,
            hintStyle: TextStyle(color: ColorConstant.manatee),
            hintText: "${'55'.tr}...",
            prefixIcon: IconButton(
                onPressed: () => controller.searchItems(),
                icon: Image.asset('assets/images/search_icon.png'),
                color: ColorConstant.manatee),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.theme.cardColor),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: context.theme.cardColor),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.theme.cardColor),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}