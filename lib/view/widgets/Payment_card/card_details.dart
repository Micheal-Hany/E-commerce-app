import 'package:flutter/material.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';

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
              buttonName: "Add New Card",
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

class CustomButtonAddNewcard extends StatelessWidget {
  const CustomButtonAddNewcard({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.backgroundColor,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String buttonName;
  final void Function()? onPressed;
  final Color backgroundColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.deepPurpleAccent),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style:
              CustomStyle.textStyle17.copyWith(color: const Color(0xff9775FA)),
        ),
      ),
    );
  }
}
