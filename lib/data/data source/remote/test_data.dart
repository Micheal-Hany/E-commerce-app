import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.usersData, {});
    return response.fold((l) => l, (r) => r);
  }
}
