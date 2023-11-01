import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:News4you/model_class/model_class.dart';
import 'package:http/http.dart' as http;

class home_screen_controller with ChangeNotifier {
  PublicApiResponce? responceData;
  bool loading = false;

  fetchdata({String? searchquery = "technology"}) async {
    final Url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$searchquery&apiKey=ee044c603d884e6ca4c147c9eb7bac04");
    var responce = await http.get(Url);
    var decodedata = (jsonDecode(responce.body));
    print(responce.statusCode);

    responceData = PublicApiResponce.fromJson(decodedata);

    notifyListeners();
  }
}
