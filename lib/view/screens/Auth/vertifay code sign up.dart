import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/signup%20verifay%20code%20controller.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20bodyAuth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';

class SignUpVerifayCode extends StatelessWidget {
  const SignUpVerifayCode({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpVerifayCodeControllerImpl controller =
        Get.put(SignUpVerifayCodeControllerImpl());
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
            '41'.tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: GetBuilder<SignUpVerifayCodeControllerImpl>(
          builder: (controller) {
            if (controller.stateRequest == StatusRequest.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextAuthTitle(title: '40'.tr),
                      const SizedBox(height: 18),
                      CustomTextBodyAuth(
                          bodyText: '${'40'.tr}\n"${controller.email}"'),
                      const SizedBox(height: 50),
                      Container(
                        child: OtpTextField(
                          borderRadius: BorderRadius.circular(15),
                          clearText: true,
                          fieldWidth: 50,
                          numberOfFields: 5,
                          borderColor: Colors.black,
                          showFieldAsBox: true,
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessPage(verificationCode);
                          },
                        ),
                      ),
                    ],
                  ));
            }
          },
        ));
  }
}
