import 'package:get/get.dart';
import 'package:store_app/controller/Auth/login%20controller.dart';
import 'package:store_app/controller/Auth/reset%20password%20success%20conteoller.dart';
import 'package:store_app/controller/Auth/sign%20up%20controller.dart';
import 'package:store_app/controller/Auth/sign%20up%20success%20conteoller.dart';
import 'package:store_app/controller/Auth/signup%20verifay%20code%20controller.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/controller/Home/favorite_page_controller.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/controller/Map_controller.dart';
import 'package:store_app/controller/Sign_in_with_controller.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
import 'package:store_app/controller/add_review_controller.dart';
import 'package:store_app/controller/forgetpassword/forget%20password%20controller.dart';
import 'package:store_app/controller/forgetpassword/reset%20password%20contreoller.dart';
import 'package:store_app/controller/forgetpassword/verifay%20code%20controller.dart';
import 'package:store_app/controller/onBoarding_controller.dart';
import 'package:store_app/controller/order_confermied_controller.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/controller/payment_card_controller.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/controller/review_page_controller.dart';
import 'package:store_app/controller/view-avalible_card_controller.dart';
import 'package:store_app/core/class/crud.dart';
import 'package:store_app/view/widgets/language/change_Language.dart';

class InitailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderTrackController());
    Get.put(Crud());

    Get.put(ResetPasswordControllerImpl());

    // Get.put(PasswordController());
    Get.put(HaomeScreenContollerImpl());
    Get.put(CartPageControllerImpl());

    Get.put(ProductDetailesControllerImpl());
    Get.put(HomeControllerImpl());
    Get.put(ViewAvailableAddressesController());
    Get.put(LoginControllerImpl());
    Get.put(SuccessRestPasswordControllerImpl());
    Get.put(SignUpControllerImpl());
    Get.put(SignUpVerifayCodeControllerImpl());
    Get.put(ForgeTPasswordControllerimpl());
    Get.put(VerifayCodeControllerImpl());
    Get.put(SuccessSignUpControllerImpl());

    Get.put(FavoriteControllerImpl());

    Get.put(WalletController());
    // Get.put(AddNewcardController());
    Get.put(AddReviewControllerimple());
    Get.put(MapController());
    Get.put(onBordingControllerImplment());
    Get.put(CreditCardController());
    Get.put(ReviewPageControllerImpl());
    Get.put(SignInWithController());
    Get.put(ViewAvailableCardsController());
    Get.put(LocalController());
    Get.put(OrderConferiedController());

    // Get.put(());
    // Get.put(());
  }
}
