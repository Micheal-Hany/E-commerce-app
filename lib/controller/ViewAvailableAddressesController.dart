import 'package:get/get.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/address_model.dart';

class ViewAvailableAddressesController extends GetxController {
  CartPageControllerImpl cartPageControllerImpl =
      Get.put(CartPageControllerImpl());
  List<AddressModel> addressList = <AddressModel>[].obs;
  MyServices myServices = Get.find();

  AddressModel? currentSelected;

  void setSelectedAddress(int index) {
    currentSelected = addressList[index];
    myServices.sharedPreferences.setString("country", currentSelected!.country);
    myServices.sharedPreferences.setString("city", currentSelected!.street);
    cartPageControllerImpl.getDeliverAddress();
    update();
  }

  bool isAddressSelected(int index) {
    return currentSelected == addressList[index];
  }

  goToMap() {
    Get.toNamed(AppRouts.addressPage);
  }

  goToAddItManually() {
    Get.toNamed(AppRouts.addAddressPageFildes);
  }

  goBack() {
    Get.back();
  }

  getAllAddresses() async {
    addressList = await DBHelper.instance().getAllAddresses("addresses");
    update();
  }

  void removeAddress(AddressModel addressModel) async {
    await DBHelper.instance().deleteAddress("addresses", addressModel);
    getAllAddresses();
    update();
  }

  @override
  void onInit() {
    getAllAddresses();
    super.onInit();
  }
}
