import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Auth/Custom%20Go%20To%20Register%20Page.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20bodyAuth.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20form%20filed.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';
import 'package:store_app/view/widgets/Auth/custom%20button%20Auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Sing in',
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
              Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
              const CustomTextAuthTitle(title: 'Welcome Back'),
              const SizedBox(height: 18),
              const CustomTextBodyAuth(
                  bodyText:
                      'Sign in with your Emai and Password\nor continue with social Media'),
              const SizedBox(height: 80),
              const CustomTextFormFiled(
                mrController: null,
                iconData: Icons.email_outlined,
                lableTitle: 'Email',
              ),
              const SizedBox(height: 30),
              const CustomTextFormFiled(
                mrController: null,
                iconData: Icons.lock,
                lableTitle: 'Password',
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Forget password',
                textAlign: TextAlign.end,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtonAuth(
                onPressed: () {},
                title: 'Log in',
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomGoToRegisterPage()
            ],
          )),
    );
  }
}
