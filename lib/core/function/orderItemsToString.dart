import 'package:store_app/core/function/translate_database.dart';
import 'package:store_app/data/model/product_model.dart';

String orderItemsToString(List<ProductModel> items) {
  return items
      .map((item) => translateDataBase(item.itemNameAr, item.itemNameEn) ?? '')
      .join(', ');
}
