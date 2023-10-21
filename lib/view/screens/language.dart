import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:store_app/view/widgets/language/custom%20button%20lang.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              CustomButtonLang(
                  textbutton: "Ar",
                  onPressed: () {
                    //controller.changeLang("ar");
                    // Get.toNamed(AppRoute.onBoarding) ;
                  }),
              CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    //controller.changeLang("en");
                    // Get.toNamed(AppRoute.onBoarding) ;
                  }),
            ],
          )),
    );
  }
}
