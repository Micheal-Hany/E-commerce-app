import 'package:flutter/material.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';


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
            cardBgColor: const Color(0xff122D4F),
            cardNumber: creditCardController.cardNumber.value,
            expiryDate: creditCardController.expiryDate.value,
            cardHolderName: creditCardController.cardHolderName.value,
            cvvCode: creditCardController.cvvCode.value,
            showBackView: creditCardController.isCvvFocused.value,
            onCreditCardWidgetChange: (CreditCardBrand) {},
          ),
          const SizedBox(height: 20),
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
            cvvValidationMessage: 'Please input a valid CVV',
            dateValidationMessage: 'Please input a valid date',
            numberValidationMessage: 'Please input a valid number',
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
            inputConfiguration: const InputConfiguration(
              cardNumberDecoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEFEFE)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Number',
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                hintText: 'XXXX XXXX XXXX XXXX',
                hintStyle: TextStyle(fontSize: 12),
              ),
              expiryDateDecoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEFEFE)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Expired Date',
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                hintText: 'XX/XX',
                hintStyle: TextStyle(fontSize: 12),
              ),
              cvvCodeDecoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEFEFE)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'CVV',
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                hintText: 'XXX',
                hintStyle: TextStyle(fontSize: 12),
              ),
              cardHolderDecoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEFEFE)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Card Holder',
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                hintText: 'Card Holder',
                hintStyle: TextStyle(fontSize: 12),
              ),
              cardNumberTextStyle: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              cardHolderTextStyle: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              expiryDateTextStyle: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              cvvCodeTextStyle: TextStyle(
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