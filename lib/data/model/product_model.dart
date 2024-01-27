import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:get/get.dart';

class ProductModel {
  int? itemId;
  String? itemNameEn;
  String? itemNameAr;
  String? itemDecriptionAr;
  String? itemDecriptionEn;
  String? itemImage;
  int? itemCount;
  int? itemDiscount;
  int? itemPrice;
  String? itemDate;
  int? itemActive;
  int? itemCategory;
  int? categoriesId;
  String? categoriesNameAr;
  String? categoriesNameEn;
  String? categoriesImage;
  String? categoriesDatetime;

  ProductModel(
      {this.itemId,
      this.itemNameEn,
      this.itemNameAr,
      this.itemDecriptionAr,
      this.itemDecriptionEn,
      this.itemImage,
      this.itemCount,
      this.itemDiscount,
      this.itemPrice,
      this.itemDate,
      this.itemActive,
      this.itemCategory,
      this.categoriesId,
      this.categoriesNameAr,
      this.categoriesNameEn,
      this.categoriesImage,
      this.categoriesDatetime});

  ProductModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemNameEn = json['item_name_en'];
    itemNameAr = json['item_name_ar'];
    itemDecriptionAr = json['item_decription_ar'];
    itemDecriptionEn = json['item_decription_en'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemDiscount = json['item_discount'];
    itemPrice = json['item_price'];
    itemDate = json['item_date'];
    itemActive = json['item_active'];
    itemCategory = json['item_category'];
    categoriesId = json['categories_id'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesNameEn = json['categories_name_en'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name_en'] = itemNameEn;
    data['item_name_ar'] = itemNameAr;
    data['item_decription_ar'] = itemDecriptionAr;
    data['item_decription_en'] = itemDecriptionEn;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_discount'] = itemDiscount;
    data['item_price'] = itemPrice;
    data['item_date'] = itemDate;
    data['item_active'] = itemActive;
    data['item_category'] = itemCategory;
    data['categories_id'] = categoriesId;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_name_en'] = categoriesNameEn;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
