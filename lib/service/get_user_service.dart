import 'package:api/models/currency_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CurrencyService {
  static Future<List<Welcome>> getData() async {
    Response res = await Dio().get("https://nbu.uz/en/exchange-rates/json/");
    print(res.data);
    return (res.data as List)
        .map((element) => Welcome.fromJson(element))
        .toList();
  }
}
