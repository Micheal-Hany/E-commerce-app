import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/function/internet_check.dart';

class Crud {
  // Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
  //   if (await checkInternet()) {
  //     var response = await http.post(Uri.parse(linkurl), body: data);
  //     print("111111111111111111111111111111111111111111111111");
  //     print(response.body);
  //     print("111111111111111111111111111111111111111111111111");

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Map responsebody = jsonDecode(response.body.toString());
  //       print(responsebody.toString());
  //       return Right(responsebody);
  //     } else {
  //       return const Left(StatusRequest.serverFailure);
  //     }
  //   } else {
  //     return const Left(StatusRequest.offlinefailure);
  //   }
  // }

  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
      String linkurl, Map<String, dynamic> data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          var responseBody = await jsonDecode(response.body);

          return Right(responseBody);
        } catch (e) {
          print("Error parsing JSON: $e");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        print("Error Response Status Code: ${response.statusCode}");
        print("Error Response Body: ${response.body}");
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, List<Map<String, dynamic>>>> getData(
      String linkurl) async {
    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl));

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> responseData = jsonDecode(response.body);
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(responseData);
        print(data.toString());
        return Right(data);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
