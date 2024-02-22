import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/language/change_Language.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LocalController>();
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              CustomButton(
                  buttonName: "Ar",
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.toNamed(AppRouts.onBording);
                  },
                  backgroundColor: ColorConstant.primary,
                  width: double.infinity - 20,
                  height: 40),
              // CustomButtonLang(
              //     textbutton: "Ar",
              // onPressed: () {
              //   controller.changeLang("ar");
              //   Get.toNamed(AppRouts.onBording);
              // }),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                  buttonName: "En",
                  onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed(AppRouts.onBording);
                  },
                  backgroundColor: ColorConstant.primary,
                  width: double.infinity - 20,
                  height: 40),
              // CustomButtonLang(
              //     textbutton: "En",
              //     onPressed: () {
              // controller.changeLang("en");
              // Get.toNamed(AppRouts.onBording);
              //     }),
            ],
          )),
    );
  }
}
