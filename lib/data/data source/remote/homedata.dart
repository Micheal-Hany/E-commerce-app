import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }
}
