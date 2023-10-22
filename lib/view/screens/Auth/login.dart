import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';

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
              Text(
                'Welcome Back',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Text(
                'Sign in with your Emai and Password\nor continue with social Media',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(height: 1.3),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              const CustomTextFormFiled(
                iconData: Icons.email_outlined,
                lableTitle: '   Email   ',
              ),
              const SizedBox(height: 18),
              const CustomTextFormFiled(
                iconData: Icons.lock,
                lableTitle: '   Password   ',
              )
            ],
          )),
    );
  }
}

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key, required this.lableTitle, required this.iconData});
  final String lableTitle;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.grey,
      decoration: InputDecoration(
        suffixIcon: Icon(iconData),
        suffixIconColor: AppColor.grey,
        labelStyle: const TextStyle(color: AppColor.grey),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: Text(lableTitle),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
