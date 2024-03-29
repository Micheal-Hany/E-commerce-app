import 'package:flutter/material.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Payment_card/Custom_paymet_app_bar.dart';
import 'package:store_app/view/widgets/Payment_card/card_details.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/address_page/swich_key.dart';
import 'package:get/get.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});
  @override
  Widget build(BuildContext context) {
    // Get.put(CreditCardController());
    Get.find<CreditCardController>();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.getWidth(context) * .02,
              vertical: 40,
            ),
            child: GetBuilder<CreditCardController>(
              builder: (controller) {
                return Column(
                  children: [
                    const CustomPaymentcardAppBar(),
                    MyCreditCardWidget(creditCardController: controller),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "95".tr,
                          style: context.bodySmall!.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        SwitchSavePayment(
                          controller: controller,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        buttonName: "96".tr,
                        onPressed: () => controller.saveCardDetailes(),
                        backgroundColor: const Color(0xff9775FA),
                        width: double.infinity - 20,
                        height: 40)
                  ],
                );
              },
            )),
      ),
    );
  }
}
