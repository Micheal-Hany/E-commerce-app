import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/main.dart';

class CustomNotifacationButton extends StatelessWidget {
  const CustomNotifacationButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color(0xff9775FA),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: GetBuilder<HomeControllerImpl>(
          builder: (controller) {
            print(controller.speechEnabled);
            return IconButton(
              icon: !controller.speechEnabled
                  ? const Icon(
                      Icons.mic_off,
                      color: Colors.white,
                    )
                  : const Icon(Icons.mic, color: Colors.white),
              onPressed: () => !controller.speechEnabled
                  ? controller.stopListening()
                  : controller.startListening(),
            );
          },
        ));
  }
}

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
