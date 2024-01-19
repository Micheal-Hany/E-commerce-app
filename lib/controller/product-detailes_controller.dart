import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class ProductDetailesController extends GetxController {
  goToProduct();
  backToHomePage();
}

class ProductDetailesControllerImpl extends ProductDetailesController {
  final ProductModel product = Get.arguments;
  @override
  goToProduct() {
    Get.toNamed(AppRouts.productPage);
  }

  @override
  backToHomePage() {
    Get.back();
  }

  goToReviewPage() {
    Get.toNamed(AppRouts.reviewPage);
  }

  void addProductToDatabase(ProductModel product) async {
    ProductModel? existingProduct = await DBHelper.instance()
        .getProductById(product.itemId!, "Cart_Products");

    if (existingProduct != null) {
      print('already exists: ${product.itemId}');
    } else {
      int productId =
          await DBHelper.instance().insertProduct("Cart_Products", product);

      print('Product inserted with ID: $productId');
    }
  }
}
