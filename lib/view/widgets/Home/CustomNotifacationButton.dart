import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:get/get.dart';

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
            print(controller.isLising);
            return IconButton(
              icon: !controller.isLising
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
