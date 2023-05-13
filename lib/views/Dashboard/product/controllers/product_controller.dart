import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shopease/utilities/app_const.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static Future addToFavourite(Products product) async {
    try {
      EasyLoading.show();
      final userID = auth.currentUser!.uid;

      await firestore
          .collection('users')
          .doc(userID)
          .collection('favourites')
          .doc(product.id.toString())
          .set({
        'id': product.id,
        'title': product.title,
        'reviews': product.reviews,
        'description': product.description,
        'price': product.price,
        'discountPercentage': product.discountPercentage,
        'brand': product.brand,
        'category': product.category,
        'thumbnail': product.thumbnail,
        'images': product.images,
        'rating': product.rating,
        'time_stamp': DateTime.now()
      });
      EasyLoading.dismiss();
      rawSackbar('Added to favourites');
    } on Exception {
      EasyLoading.dismiss();
      rawSackbar('Something went wrong try again later');
    }
  }

  removeToFavourites(Products product) async {
    try {
      EasyLoading.show();
      final userID = auth.currentUser!.uid;

      await firestore
          .collection('users')
          .doc(userID)
          .collection('favourites')
          .doc(product.id.toString())
          .delete();
      EasyLoading.dismiss();
      rawSackbar('Removed from favourites');
    } on Exception {
      EasyLoading.dismiss();
      rawSackbar('Something went wrong try again later');
    }
  }

  addToCart(Products product) async {
    try {
      EasyLoading.show();
      final userID = auth.currentUser!.uid;
      await firestore
          .collection('users')
          .doc(userID)
          .collection('cart')
          .doc(product.id.toString())
          .set({
        'id': product.id,
        'title': product.title,
        'reviews': product.reviews,
        'description': product.description,
        'price': product.price,
        'discountPercentage': product.discountPercentage,
        'brand': product.brand,
        'category': product.category,
        'thumbnail': product.thumbnail,
        'images': product.images,
        'rating': product.rating,
        'quantity': 1,
        'time_stamp': DateTime.now()
      });
      EasyLoading.dismiss();
      rawSackbar('Added to cart 😃');
    } on Exception {
      EasyLoading.dismiss();
      rawSackbar('Something went wrong try again later');
    }
  }

  static Future<List<Products>> getProducts(String category) async {
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
}
