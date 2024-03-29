import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/reset%20password%20success%20conteoller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';

class ResetPasswordSuccess extends StatelessWidget {
  const ResetPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SuccessRestPasswordControllerImpl());
    Get.find<SuccessRestPasswordControllerImpl>();

    return Scaffold(
      backgroundColor: context.myTheme.scaffoldBackgroundColor,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: AppColor.primaryColor,
      //   elevation: 0.0,
      //   title: Text('32'.tr,
      //       style: Theme.of(context)
      //           .textTheme
      //           .displayLarge!
      //           .copyWith(color: AppColor.primaryColor)),
      // ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const SizedBox(
            height: 150,
          ),
          Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: ColorConstant.primary,
          )),
          Text("37".tr, style: context.headlineLarge),
          Text("39".tr),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: GetBuilder<SuccessRestPasswordControllerImpl>(
                builder: (controller) {
                  return CustomButton(
                      buttonName: "31".tr,
                      onPressed: () => controller.goToLoginPage(),
                      backgroundColor: ColorConstant.primary,
                      width: double.infinity - 20,
                      height: 40);
                },
              )),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtomAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
