import 'package:get/get.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/custom_snackbar.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/data%20source/remote/review_data.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/data/model/review_model.dart';

abstract class ProductDetailesController extends GetxController {
  goToProduct();
  backToHomePage();
}

class ProductDetailesControllerImpl extends ProductDetailesController {
  CartPageControllerImpl controller = Get.find<CartPageControllerImpl>();
  ReviewData reviewData = ReviewData(Get.find());
  StatusRequest stateRequest = StatusRequest.none;
  List<ReviewModel> reviews = [];

  getReviews(String id) async {
    reviews.clear();
    stateRequest = StatusRequest.loading;
    var response = await reviewData.getReviews(id.toString());
    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response["status"] == "success") {
        List<ReviewModel> reviewModel = (response["data"] as List<dynamic>)
            .map((item) => ReviewModel.fromJson(item))
            .toList();
        reviews.addAll(reviewModel);
      } else {
        stateRequest = StatusRequest.failure;
      }
    }
    update();
  }

  ProductModel product = ProductModel();
  ProductModel getProductModel() {
    product = Get.arguments;
    return product;
  }

  @override
  goToProduct() {
    Get.toNamed(AppRouts.productPage);
  }

  @override
  backToHomePage() {
    Get.back();
  }

  goToReviewPage() {
    Get.toNamed(AppRouts.reviewPage,
        arguments: reviews, parameters: {"id": "${product.itemId}"});
  }

  void addProductToDatabase(ProductModel product) async {
    ProductModel? existingProduct = await DBHelper.instance()
        .getProductById(product.itemId!, "Cart_Products");

    if (existingProduct != null) {
      print('already exists: ${product.itemId}');
      customSnackbar(
        "155".tr,
        "",
      );
    } else {
      int productId =
          await DBHelper.instance().insertProduct("Cart_Products", product);
      customSnackbar(
        "127".tr,
        "",
      );
      print('Product inserted with ID: $productId');
    }
    // controller.onInit();
    controller.getOrderdProducts();
    update();
  }

  String formatDate(DateTime date) {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    int day = date.day;
    String month = months[date.month - 1];
    int year = date.year;

    return '$day $month, $year';
  }
}
