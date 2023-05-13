import 'package:shopease/utilities/app_const.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxInt filterIndex = 10.obs;
  Stream<List<Products>> getFavourites() {
    final userID = auth.currentUser!.uid;
    return firestore
        .collection('users')
        .doc(userID)
        .collection('favourites')
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
                images: List.from(e['images'])))
            .toList());
  }
}
