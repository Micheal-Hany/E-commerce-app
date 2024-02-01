import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/controller/address_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/address_page/address_page_app_bar.dart';
import 'package:store_app/view/widgets/address_page/labled_text_form.dart';
import 'package:store_app/view/widgets/address_page/swich_key.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddressPageController controller = Get.put(AddressPageController());

    return Scaffold(
      body: GetBuilder<AddressPageController>(
        builder: (_) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.getWidth(context) * .02,
                vertical: 40,
              ),
              child: Column(
                children: [
                  CustomAddressAppBar(controller: controller),
                  SizedBox(height: Dimensions.getHeight(context) * .05),
                  LabeledTextField(
                    hintText: '82'.tr,
                    label: '75'.tr,
                    controller: controller.nameController,
                  ),
                  SizedBox(height: Dimensions.getHeight(context) * .013),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LabeledTextField(
                        hintText: '83'.tr,
                        label: '76'.tr,
                        controller: controller.countryController,
                        width: Dimensions.getWidth(context) / 2.2,
                      ),
                      LabeledTextField(
                        hintText: '84'.tr,
                        label: '77'.tr,
                        controller: controller.cityController,
                        width: Dimensions.getWidth(context) / 2.2,
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.getHeight(context) * .013),
                  LabeledTextField(
                    hintText: '+880 1453-987533',
                    label: '78'.tr,
                    controller: controller.phoneNumberController,
                  ),
                  SizedBox(height: Dimensions.getHeight(context) * .013),
                  LabeledTextField(
                    hintText: '85'.tr,
                    label: '79'.tr,
                    controller: controller.addressController,
                  ),
                  SizedBox(height: Dimensions.getHeight(context) * .013),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "80".tr,
                        style: CustomStyle.textStyle15.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1D1E20),
                        ),
                      ),
                      SwitchExample(
                        controller: controller,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  CustomButton(
                      buttonName: "81".tr,
                      onPressed: () {},
                      backgroundColor: const Color(0xff9775FA),
                      width: double.infinity - 20,
                      height: 40)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
