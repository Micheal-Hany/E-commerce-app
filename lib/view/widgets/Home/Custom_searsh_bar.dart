import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/view/widgets/Home/CustomNotifacationButton.dart';
import 'package:store_app/view/widgets/Home/CustomSearchFiled.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key, required this.controller}) : super(key: key);
  final HomeControllerImpl controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSearchFiled(controller: controller),
        const SizedBox(
          width: 5,
        ),
        CustomNotifacationButton(controller: controller),
      ],
    );
  }
}
