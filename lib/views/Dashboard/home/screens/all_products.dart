import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:shopease/views/Dashboard/home/controllers/home_controller.dart';
import 'package:shopease/views/Dashboard/product/screens/product_details.dart';
import 'package:shopease/widgets/product_card.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key,
      required this.sale,
      required this.newItem,
      required this.productsList});
  final bool sale;
  final bool newItem;

  final List<Products> productsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.black),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 1,
        title: Text(
          sale ? 'Sale Products' : 'New Products',
          style: AppTextStyle.mediumBlack20,
        ),
      ),
      body: StreamBuilder(
        stream: HomeController.getFavourites(),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  itemCount: 6,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10, bottom: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 300,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    List data = productsList.reversed.toList();
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetails(
                              sale: sale,
                              product: sale ? data[index] : productsList[index],
                            ));
                      },
                      child: ProductCard(
                        sale: sale,
                        newItem: newItem,
                        favourate: snapshot.data!
                            .contains(productsList[index].id!.toString()),
                        product: sale ? data[index] : productsList[index],
                      ),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
