import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';

class SignInWithPage extends StatelessWidget {
  const SignInWithPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(),
      //value: context.myTheme.appBarTheme.systemOverlayStyle!,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CustomCartIcon(
                        widget: const Icon(Icons.arrow_back_rounded),
                        onPressed: () {},
                        backgroundColor: ColorConstant.manatee),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Let’s Get Started',
                      style: context.headlineMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomSignInButton(
                  widget: Image.asset("assets/images/facebook.png"),
                  buttonName: "facebook",
                  onPressed: () {},
                  backgroundColor: const Color(0xff4267B2),
                  width: double.infinity - 20,
                  height: 50,
                ),
                const SizedBox(height: 15),
                CustomSignInButton(
                  widget: Image.asset("assets/images/twitter.png"),
                  buttonName: "twitter",
                  onPressed: () {},
                  backgroundColor: const Color(0xff1DA1F2),
                  width: double.infinity - 20,
                  height: 50,
                ),
                const SizedBox(height: 15),
                CustomSignInButton(
                  widget: Image.asset("assets/images/google.png"),
                  buttonName: "google",
                  onPressed: () {},
                  backgroundColor: const Color(0xffEA4335),
                  width: double.infinity - 20,
                  height: 50,
                ),
                const SizedBox(height: 280),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: context.bodyLarge,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Signin",
                        style: context.bodyLarge!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    buttonName: "Create an Account",
                    onPressed: () {},
                    backgroundColor: ColorConstant.primary,
                    width: double.infinity - 20,
                    height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
