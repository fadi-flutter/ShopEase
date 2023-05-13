import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:shopease/views/Dashboard/home/controllers/home_controller.dart';
import 'package:shopease/views/Dashboard/home/screens/all_products.dart';
import 'package:shopease/views/Dashboard/home/screens/sale_new_screen.dart';
import 'package:shopease/views/Dashboard/product/screens/product_details.dart';
import 'package:shopease/widgets/long_button.dart';
import 'package:shopease/widgets/product_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: FutureBuilder<List<Products>>(
        future: HomeController.getProducts(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: height * 0.64,
                            width: double.infinity,
                            child: Image.network(
                              snapshot.data![29].thumbnail ?? '',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(left: 14, bottom: 20),
                            height: height * 0.64,
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
                                  'On sale',
                                  style: AppTextStyle.boldWhite30.copyWith(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(height: 5),
                                LongButton(
                                  onPressed: () {
                                    Get.to(() => SaleNewScreen(
                                          productsList: snapshot.data!,
                                        ));
                                  },
                                  width: 130,
                                  height: 40,
                                  text: 'Check',
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  'New',
                                  style: AppTextStyle.boldBlack30.copyWith(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w700),
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
                                        productsList: snapshot.data!,
                                      ));
                                },
                                child: Text("View all",
                                    style: AppTextStyle.regularBlack14))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => ProductDetails(
                                      product: snapshot.data![index],
                                    ));
                              },
                              child: ProductCard(
                                showHeart: false,
                                product: snapshot.data![index],
                                sale: false,
                                newItem: true,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.black,
                  ),
                );
        },
      ),
    );
  }
}
