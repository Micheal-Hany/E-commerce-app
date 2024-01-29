import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getCategories() async {
    var response = await crud.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }

  getItems(String categoryId) async {
    var response =
        await crud.postData("${AppLink.items}?categories_id=$categoryId", {});

    // print("-----------------------------");
    // print(response);
    // print("-----------------------------");
    return response.fold((l) => l, (r) => r);
  }

  search(String search) async {
    var response = await crud
        .postData("${AppLink.search}?search=$search", {"search": search});
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
