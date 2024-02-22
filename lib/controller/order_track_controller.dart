
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/order_model.dart';
import 'package:store_app/data/model/product_model.dart';

class OrderTrackController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  RxList<OrderModel> orders = <OrderModel>[].obs;
  List<ProductModel> items = [];
  var selectedItem = "".obs;

  selectItem(ProductModel item) {
    selectedItem.value = "${item.itemId!}";
    print(selectedItem.value);
    Get.toNamed(AppRouts.addReviewPage, parameters: {"id": selectedItem.value});

    return selectedItem.value;
  }

  getOrders() async {
    statusRequest = StatusRequest.loading;
    orders.value = await DBHelper.instance().getOrders();
    statusRequest = StatusRequest.success;
    items = orders.expand((element) => element.items).toList();
    update();
  }

  goBack() {
    Get.back();
  }

  String formatDateTime(DateTime dateTime) {
    // Format date
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';

    String hours = (dateTime.hour % 12).toString().padLeft(2, '0');
    String minutes = dateTime.minute.toString().padLeft(2, '0');
    String time = '$hours:$minutes';

    String amPm = dateTime.hour < 12 ? 'AM' : 'PM';

    return '($date)($time)($amPm)';
  }
}
