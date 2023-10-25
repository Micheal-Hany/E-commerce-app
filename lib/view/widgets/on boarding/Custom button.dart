import 'package:flutter/material.dart';
import 'package:store_app/controller/onording_controller.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<onBordingControllerImplment> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
        // margin: const EdgeInsets.only(bottom: 30),
        child: TextButton(
          onPressed: () {
            controller.next();
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xff8a5365)),
          ),
          child: Text(
            "8".tr,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ));
  }
}


// MaterialButton(
//           padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
//           textColor: Colors.white,
//           onPressed: () {
//             controller.next();
//           },
//           color: const Color(0xff8a5365),
//           child: const Text("Continue")),