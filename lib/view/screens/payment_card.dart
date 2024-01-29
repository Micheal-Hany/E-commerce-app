import 'package:flutter/material.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Payment_card/Custom_paymet_app_bar.dart';
import 'package:store_app/view/widgets/Payment_card/card_details.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/address_page/swich_key.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});
  @override
  Widget build(BuildContext context) {
    final CreditCardController controller = CreditCardController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.getWidth(context) * .02,
            vertical: 40,
          ),
          child: Column(
            children: [
              const CustomPaymentcardAppBar(),
              MyCreditCardWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Save card info",
                    style: CustomStyle.textStyle15.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff1D1E20),
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
                  buttonName: "Save Card",
                  onPressed: () {},
                  backgroundColor: const Color(0xff9775FA),
                  width: double.infinity - 20,
                  height: 40)
            ],
          ),
        ),
      ),
    );
  }
}

// class MyCreditCardWidget extends StatefulWidget {
//   const MyCreditCardWidget({Key? key}) : super(key: key);

//   @override
//   _MyCreditCardWidgetState createState() => _MyCreditCardWidgetState();
// }

// class _MyCreditCardWidgetState extends State<MyCreditCardWidget> {
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;

//   GlobalKey<FormFieldState<String>>? cardNumberKey;
//   GlobalKey<FormFieldState<String>>? cardHolderKey;
//   GlobalKey<FormFieldState<String>>? expiryDateKey;
//   GlobalKey<FormFieldState<String>>? cvvCodeKey;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           CreditCardWidget(
//             cardBgColor: const Color(0xff122D4F),
//             cardNumber: cardNumber,
//             expiryDate: expiryDate,
//             cardHolderName: cardHolderName,
//             cvvCode: cvvCode,
//             showBackView: isCvvFocused,
//             onCreditCardWidgetChange: (CreditCardBrand) {},
//           ),
//           const SizedBox(height: 20),
//           CreditCardForm(
//             formKey: formKey,
//             cardNumber: cardNumber,
//             expiryDate: expiryDate,
//             cardHolderName: cardHolderName,
//             cvvCode: cvvCode,
//             cardNumberKey: cardNumberKey,
//             cvvCodeKey: cvvCodeKey,
//             expiryDateKey: expiryDateKey,
//             cardHolderKey: cardHolderKey,
//             onCreditCardModelChange: onCreditCardModelChange,
//             obscureCvv: true,
//             obscureNumber: true,
//             isHolderNameVisible: true,
//             isCardNumberVisible: true,
//             isExpiryDateVisible: true,
//             enableCvv: true,
//             cvvValidationMessage: 'Please input a valid CVV',
//             dateValidationMessage: 'Please input a valid date',
//             numberValidationMessage: 'Please input a valid number',
          //   cardNumberValidator: (String? cardNumber) {
          //     return null;
          //   },
          //   expiryDateValidator: (String? expiryDate) {
          //     return null;
          //   },
          //   cvvValidator: (String? cvv) {
          //     return null;
          //   },
          //   cardHolderValidator: (String? cardHolderName) {
          //     return null;
          //   },
          //   onFormComplete: () {
          //     // callback to execute at the end of filling card data
          //   },
          //   autovalidateMode: AutovalidateMode.always,
          //   disableCardNumberAutoFillHints: false,
          //   inputConfiguration: const InputConfiguration(
          //     cardNumberDecoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.grey),
          //           borderRadius: BorderRadius.all(Radius.circular(10))),
          //       border: OutlineInputBorder(
          //           borderSide: BorderSide(color: Color(0xffFEFEFE)),
          //           borderRadius: BorderRadius.all(Radius.circular(10))),
          //       labelText: 'Number',
          //       labelStyle: TextStyle(fontSize: 14, color: Colors.black),
          //       hintText: 'XXXX XXXX XXXX XXXX',
          //       hintStyle: TextStyle(fontSize: 12),
          //     ),
          //     expiryDateDecoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.grey),
          //           borderRadius: BorderRadius.all(Radius.circular(10))),
          //       border: OutlineInputBorder(
          //           borderSide: BorderSide(color: Color(0xffFEFEFE)),
          //           borderRadius: BorderRadius.all(Radius.circular(10))),
          //       labelText: 'Expired Date',
          //       labelStyle: TextStyle(fontSize: 14, color: Colors.black),
          //       hintText: 'XX/XX',
          //       hintStyle: TextStyle(fontSize: 12),
          //     ),
          //     cvvCodeDecoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.grey),
          //           borderRadius: BorderRadius.all(Radius.circular(10))),
          //       border: OutlineInputBorder(
          //           borderSide: BorderSide(color: Color(0xffFEFEFE)),
          //           borderRadius: BorderRadius.all(Radius.circular(10))),
          //       labelText: 'CVV',
          //       labelStyle: TextStyle(fontSize: 14, color: Colors.black),
          //       hintText: 'XXX',
          //       hintStyle: TextStyle(fontSize: 12),
          //     ),
          //     cardHolderDecoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.grey),
          //           borderRadius: BorderRadius.all(Radius.circular(10))),
          //       border: OutlineInputBorder(
          //           borderSide: BorderSide(color: Color(0xffFEFEFE)),
          //           borderRadius: BorderRadius.all(Radius.circular(10))),
          //       labelText: 'Card Holder',
          //       labelStyle: TextStyle(fontSize: 14, color: Colors.black),
          //       hintText: 'Card Holder',
          //       hintStyle: TextStyle(fontSize: 12),
          //     ),
          //     cardNumberTextStyle: TextStyle(
          //       fontSize: 16,
          //       color: Colors.black,
          //     ),
          //     cardHolderTextStyle: TextStyle(
          //       fontSize: 16,
          //       color: Colors.black,
          //     ),
          //     expiryDateTextStyle: TextStyle(
          //       fontSize: 16,
          //       color: Colors.black,
          //     ),
          //     cvvCodeTextStyle: TextStyle(
          //       fontSize: 16,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
//         ],
//       ),
//     );
//   }

  // void onCreditCardModelChange(CreditCardModel? creditCardModel) {
  //   setState(() {
  //     cardNumber = creditCardModel?.cardNumber ?? '';
  //     expiryDate = creditCardModel?.expiryDate ?? '';
  //     cardHolderName = creditCardModel?.cardHolderName ?? '';
  //     cvvCode = creditCardModel?.cvvCode ?? '';
  //     isCvvFocused = creditCardModel?.isCvvFocused ?? false;
  //   });
  // }
// }