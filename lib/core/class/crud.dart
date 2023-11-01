import 'dart:convert';

import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/function/internet_check.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatuesRequest, Map>> postData(String link, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(link), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);  
        } else {
          return const Left(StatuesRequest.serverFailure);
        }
      } else {
        return const Left(StatuesRequest.offlinefailure);
      }
    } on Exception {
      return const Left(StatuesRequest.serverFailure);
    }
  }
}
