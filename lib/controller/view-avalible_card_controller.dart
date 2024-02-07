import 'package:get/get.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/core/services/sqlite_servise.dart';

class ViewAvailableCardsController extends GetxController {
  CartPageControllerImpl cartPageControllerImpl =
      Get.put(CartPageControllerImpl());

  MyServices myServices = Get.find();
  List<CardModel> cards = [];
  CardModel? currentSelected;

  void setSelectedAddress(int index) {
    currentSelected = cards[index];

    myServices.sharedPreferences
        .setString("card_number", cards[index].cardNumber);
    cartPageControllerImpl.getCardNumber();
    update();
  }

  bool isAddressSelected(int index) {
    return currentSelected == cards[index];
  }

  goToAddNewCard() {
    Get.toNamed(AppRouts.paymentCardPage);
  }

  goBack() {
    Get.back();
  }

  getAllCards() async {
    cards = await DBHelper.instance().getAllCards("cards");
    print("--------------------------------");
    print(cards);
    print("--------------------------------");
    update();
  }

  void removeCard(CardModel cardModel) async {
    try {
      await DBHelper.instance().deleteCard("cards", cardModel);
      print('Address removed from the database successfully.');
    } catch (e) {
      print('Error removing address from the database: $e');
    }
    update();
  }

  @override
  void onInit() {
    getAllCards();
    super.onInit();
  }
}
