import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_const.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:http/http.dart' as http;

class CatalogController extends GetxController {
  RxInt filterIndex = 10.obs;
  Rx<TextEditingController> searchC = TextEditingController().obs;

  Future<List<Products>> getProducts() async {
    List<Products> data = [];
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      for (var i in decodedData['products']) {
        data.add(Products.fromJson(i));
      }
      return data;
    } else {
      rawSackbar('Check you internet connection');
      return data;
    }
  }

  Future<List<String>> getCategories() async {
    List<String> data = [];
    var response = await http.get(Uri.parse(urlCategories));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      rawSackbar('Check you internet connection');
      return data;
    }
  }

  Future<List<Products>> getCategoriesProducts(String category) async {
    List<Products> data = [];
    var response = await http.get(Uri.parse('$urlCategory/$category'));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      for (var i in decodedData['products']) {
        data.add(Products.fromJson(i));
      }
      return data;
    } else {
      rawSackbar('Check you internet connection');
      return data;
    }
  }
}
