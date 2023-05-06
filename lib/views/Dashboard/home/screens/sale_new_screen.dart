import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:shopease/views/Dashboard/home/screens/all_products.dart';
import 'package:shopease/widgets/product_card.dart';

class SaleNewScreen extends StatelessWidget {
  const SaleNewScreen({super.key, required this.productsList});
  final List<Products> productsList;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: height * 0.30,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/banner.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 14, bottom: 20),
                  height: height * 0.30,
                  alignment: Alignment.bottomLeft,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.black.withOpacity(0.5)
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Sale',
                        style: AppTextStyle.boldWhite30.copyWith(
                            fontSize: 38, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        'Sale',
                        style: AppTextStyle.boldBlack28.copyWith(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Super summer sale",
                        style: AppTextStyle.regularBlack14
                            .copyWith(color: AppColors.grey),
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => AllProducts(
                              sale: true,
                              newItem: false,
                              productsList: productsList,
                            ));
                      },
                      child:
                          Text("View all", style: AppTextStyle.regularBlack14))
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 3),
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  List data = productsList.reversed.toList();
                  return ProductCard(
                    sale: true,
                    product: data[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        'New',
                        style: AppTextStyle.boldBlack30.copyWith(
                            fontSize: 34, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "You've never seen it before!",
                        style: AppTextStyle.regularBlack14
                            .copyWith(color: AppColors.grey),
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => AllProducts(
                              sale: false,
                              newItem: true,
                              productsList: productsList,
                            ));
                      },
                      child:
                          Text("View all", style: AppTextStyle.regularBlack14))
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 3),
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductCard(
                    sale: false,
                    newItem: true,
                    product: productsList[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
