import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/forget%20password%20controller.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Auth/Custom%20Go%20To%20Register%20Page.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20bodyAuth.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20form%20filed.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';
import 'package:store_app/view/widgets/Auth/custom%20button%20Auth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgeTPasswordControllerimpl controller =
        Get.put(ForgeTPasswordControllerimpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgrounmfColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 17, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 35, 35, 35),
        ),
        title: Text(
          '14'.tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextAuthTitle(title: '27'.tr),
              const SizedBox(height: 18),
              CustomTextBodyAuth(bodyText: '29'.tr),
              const SizedBox(height: 50),
              CustomTextFormFiled(
                mrController: null,
                iconData: Icons.person,
                lableTitle: '12'.tr,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtonAuth(
                onPressed: () => controller.goToVerifayCode(),
                title: '30'.tr,
              ),
              const SizedBox(
                height: 15,
              ),
              // CustomGoToRegisterPageOrLogin(
              //   textOne: 'Already have an account? ',
              //   textTwo: 'Sign In',
              //   onTap: () {},
              // )
            ],
          )),
    );
  }
}
