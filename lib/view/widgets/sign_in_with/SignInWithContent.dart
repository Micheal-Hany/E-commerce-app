import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Sign_in_with_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/SocialSignInButton.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/sign_in_with/SignInFooter.dart';

class SignInWithContent extends StatelessWidget {
  const SignInWithContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInWithController>(
      builder: (controller) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomCartIcon(
                        widget: const Icon(Icons.arrow_back_rounded),
                        onPressed: () {},
                        backgroundColor: ColorConstant.manatee,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        '138'.tr,
                        style: context.headlineMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.getHeight(context) * .15),
                  SocialSignInButton(
                    imagePath: "assets/images/facebook.png",
                    buttonTextKey: "139",
                    onPressed: () => controller.signInWithFacebook(),
                    backgroundColor: const Color(0xff4267B2),
                  ),
                  const SizedBox(height: 15),
                  SocialSignInButton(
                    imagePath: "assets/images/twitter.png",
                    buttonTextKey: "140",
                    onPressed: () => controller.signInWithTwitter(),
                    backgroundColor: const Color(0xff1DA1F2),
                  ),
                  const SizedBox(height: 15),
                  SocialSignInButton(
                    imagePath: "assets/images/google.png",
                    buttonTextKey: "141",
                    onPressed: () => controller.signInWithGoogle(),
                    backgroundColor: const Color(0xffEA4335),
                  ),
                  SizedBox(height: Dimensions.getHeight(context) * .3),
                  SignInFooter(controller: controller),
                ],
              ),
            ));
      },
    );
  }
}
