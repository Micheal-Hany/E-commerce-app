import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart'
    as flutter_credit_card;
import 'package:get/get.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/controller/view-avalible_card_controller.dart';
import 'package:store_app/core/class/card_model.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/custom_snackbar.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/core/services/sqlite_servise.dart';

class CreditCardController extends GetxController {
  ViewAvailableCardsController viewAvailableCardsController =
      Get.put(ViewAvailableCardsController());
  CartPageControllerImpl cartPageControllerImpl =
      Get.put(CartPageControllerImpl());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  var isPrimaryAddress = false.obs;

  void onCreditCardModelChange(
      flutter_credit_card.CreditCardModel creditCardModel) {
    cardNumber = creditCardModel.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
  }

  backTocartPage() {
    Get.back();
  }

  void togglePrimaryAddress(bool value) {
    isPrimaryAddress.value = value;
  }

  gotoAddNewCard() {
    Get.toNamed(AppRouts.addPaymentCardPage);
  }

  saveCardDetailes() async {
    if (formState.currentState!.validate()) {
      await DBHelper.instance().insertCard(
          "cards",
          CardModel(
              id: Random().nextInt(100000),
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode));
      cardNumber = '';
      expiryDate = '';
      cardHolderName = '';
      cvvCode = '';
      customSnackbar(
        "127".tr,
        "",
      );
      viewAvailableCardsController.getAllCards();
      update();
    }
  }
}
