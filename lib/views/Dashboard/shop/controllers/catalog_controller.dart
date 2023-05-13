import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_const.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:http/http.dart' as http;

class CatalogController extends GetxController {
  RxInt filterIndex = 10.obs;
  RxString searchedData = ''.obs;
  RxList<String> sortedList = <String>[].obs;
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
   Stream<List<String>> getFavourites() {
    final userID = auth.currentUser!.uid;
    final collectionRef =
        firestore.collection('users').doc(userID).collection('favourites');
    return collectionRef.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) => doc.id).toList();
    });
  }

  List<String> categoriesList = <String>[
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "groceries",
    "home-decoration",
    "tops",
    "womens-dresses",
    "womens-shoes",
    "mens-shirts",
    "mens-watches",
    "womens-watches",
    "womens-bags",
    "womens-jewellery",
    "sunglasses",
    "automotive",
    "motorcycle",
  ];

  @override
  void onInit() {
    super.onInit();
    searchC.value.addListener(() {
      searchedData.value = searchC.value.text;
      sortedList.value = categoriesList
          .where(
            (element) => element.toLowerCase().contains(
                  searchedData.toLowerCase(),
                ),
          )
          .toList();
    });
  }
}
