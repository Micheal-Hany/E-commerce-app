import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/login%20controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:store_app/core/function/exit_alert.dart';
import 'package:store_app/core/function/input_validtion.dart';
import 'package:store_app/view/widgets/Auth/Custom%20Go%20To%20Register%20Page.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20bodyAuth.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20form%20filed.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';
import 'package:store_app/view/widgets/Auth/custom%20button%20Auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImpl controller = Get.put(LoginControllerImpl());

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
          '9'.tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: ViewDataHandleingRequest(
        statusRequest: controller.stateRequest,
        widget: WillPopScope(
          onWillPop: exitAlert,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: controller.formState,
              // autovalidateMode: AutovalidateMode.always,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  CustomTextAuthTitle(title: '10'.tr),
                  const SizedBox(height: 18),
                  CustomTextBodyAuth(bodyText: '11'.tr),
                  const SizedBox(height: 80),
                  CustomTextFormFiled(
                    validator: (val) => inputValidtion(val!, 5, 20, "email"),
                    mrController: controller.email,
                    iconData: Icons.email_outlined,
                    lableTitle: '12'.tr,
                  ),
                  const SizedBox(height: 30),
                  GetBuilder<LoginControllerImpl>(
                    builder: (controller) {
                      return CustomTextFormFiled(
                        obscureText: controller.showPassword,
                        onTap: () {
                          controller.showPass();
                        },
                        isNumber: false,
                        validator: (val) =>
                            inputValidtion(val!, 5, 20, "password"),
                        mrController: controller.password,
                        iconData: Icons.remove_red_eye_outlined,
                        lableTitle: '13'.tr,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () => controller.toForgetPassword(),
                    child: Text(
                      '14'.tr,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButtonAuth(
                    onPressed: () {
                      controller.login();
                    },
                    title: '15'.tr,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomGoToRegisterPageOrLogin(
                    textOne: '16'.tr,
                    textTwo: '17'.tr,
                    onTap: () => controller.goToSignUp(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
