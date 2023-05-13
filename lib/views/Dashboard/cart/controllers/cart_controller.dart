import 'package:get/get.dart';
import 'package:shopease/utilities/app_const.dart';
import 'package:shopease/views/Auth/models/products_model.dart';

class CartController extends GetxController {
  RxDouble total = 0.0.obs;
  Stream<List<Products>> getProducts() {
    final userID = auth.currentUser!.uid;
    return firestore
        .collection('users')
        .doc(userID)
        .collection('cart')
        .orderBy('time_stamp', descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => Products(
                id: e['id'],
                title: e['title'],
                reviews: e['reviews'],
                description: e['description'],
                price: e['price'],
                discountPercentage: e['discountPercentage'],
                brand: e['brand'],
                category: e['category'],
                thumbnail: e['thumbnail'],
                rating: e['rating'],
                quantity: e['quantity'],
                images: List.from(e['images'])))
            .toList());
  }

  addQuantity(Products product) {
    final userID = auth.currentUser!.uid;
    int quantity = product.quantity!;
    firestore
        .collection('users')
        .doc(userID)
        .collection('cart')
        .doc(product.id.toString())
        .update({'quantity': quantity + 1});
  }

  removeQuantity(Products product) {
    final userID = auth.currentUser!.uid;
    int quantity = product.quantity!;
    firestore
        .collection('users')
        .doc(userID)
        .collection('cart')
        .doc(product.id.toString())
        .update({'quantity': quantity - 1});
  }
}
