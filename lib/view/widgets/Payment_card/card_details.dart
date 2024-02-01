import 'package:flutter/material.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Payment_card/Custom_add_new_card_button.dart';

class MyCreditCardWidget extends StatelessWidget {
  final CreditCardController creditCardController =
      Get.put(CreditCardController());

  MyCreditCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CreditCardWidget(
            // cardBgColor: const Color(0xff122D4F),
            cardBgColor: const Color.fromARGB(255, 52, 33, 110),
            cardNumber: creditCardController.cardNumber.value,
            expiryDate: creditCardController.expiryDate.value,
            cardHolderName: creditCardController.cardHolderName.value,
            cvvCode: creditCardController.cvvCode.value,
            showBackView: creditCardController.isCvvFocused.value,
            onCreditCardWidgetChange: (CreditCardBrand) {},
          ),
          const SizedBox(height: 5),
          CustomButtonAddNewcard(
              buttonName: "87".tr,
              onPressed: () => creditCardController.gotoAddNewCard(),
              backgroundColor: const Color(0xffF6F2FF),
              width: double.infinity - 20,
              height: 40),
          CreditCardForm(
            formKey: GlobalKey<FormState>(),
            cardNumber: creditCardController.cardNumber.value,
            expiryDate: creditCardController.expiryDate.value,
            cardHolderName: creditCardController.cardHolderName.value,
            cvvCode: creditCardController.cvvCode.value,
            onCreditCardModelChange:
                creditCardController.onCreditCardModelChange,
            obscureCvv: true,
            obscureNumber: true,
            isHolderNameVisible: true,
            isCardNumberVisible: true,
            isExpiryDateVisible: true,
            enableCvv: true,
            cvvValidationMessage: '88'.tr,
            dateValidationMessage: '89'.tr,
            numberValidationMessage: '90'.tr,
            cardNumberValidator: (String? cardNumber) {
              return null;
            },
            expiryDateValidator: (String? expiryDate) {
              return null;
            },
            cvvValidator: (String? cvv) {
              return null;
            },
            cardHolderValidator: (String? cardHolderName) {
              return null;
            },
            onFormComplete: () {
              // callback to execute at the end of filling card data
            },
            autovalidateMode: AutovalidateMode.always,
            disableCardNumberAutoFillHints: false,
            inputConfiguration: InputConfiguration(
              cardNumberDecoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEFEFE)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: '91'.tr,
                labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
                hintText: 'XXXX XXXX XXXX XXXX',
                hintStyle: const TextStyle(fontSize: 12),
              ),
              expiryDateDecoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEFEFE)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: '92'.tr,
                labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
                hintText: 'XX/XX',
                hintStyle: const TextStyle(fontSize: 12),
              ),
              cvvCodeDecoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEFEFE)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: '93'.tr,
                labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
                hintText: 'XXX',
                hintStyle: const TextStyle(fontSize: 12),
              ),
              cardHolderDecoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEFEFE)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: '94'.tr,
                labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
                hintText: 'Card Holder',
                hintStyle: const TextStyle(fontSize: 12),
              ),
              cardNumberTextStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              cardHolderTextStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              expiryDateTextStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              cvvCodeTextStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
