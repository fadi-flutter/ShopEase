import 'dart:convert';

import 'package:shopease/utilities/app_const.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:http/http.dart' as http;

class HomeController {

  static Future<List<Products>> getProducts() async {
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
  static Stream<List<String>> getFavourites() {
    final userID = auth.currentUser!.uid;
    final collectionRef =
        firestore.collection('users').doc(userID).collection('favourites');
    return collectionRef.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) => doc.id).toList();
    });
  }
}
