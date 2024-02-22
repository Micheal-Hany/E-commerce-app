import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';

class ReviewData {
  Crud crud;

  ReviewData(this.crud);

  getReviews(String id) async {
    var response = await crud.postData(AppLink.getReview, {"item_id": id});
    return response.fold((l) => l, (r) => r);
  }

  postReview(String id, String name, String note, String rate) async {
    var response = await crud.postData(AppLink.makeReview, {
      "product_id": id,
      "reviewer": name,
      "note": note,
      "rate": rate,
    });
    return response.fold((l) => l, (r) => r);
  }
}
