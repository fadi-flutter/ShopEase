import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Dashboard/home/screens/sale_new_screen.dart';
import 'package:shopease/widgets/long_button.dart';
import 'package:shopease/widgets/product_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                  height: height * 0.64,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/banner.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 14, bottom: 20),
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
                        'Fashion\nsale',
                        style: AppTextStyle.boldWhite30.copyWith(
                            fontSize: 40, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 5),
                      LongButton(
                        onPressed: () {
                          Get.to(() => const SaleNewScreen());
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
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
                        Get.to(() => const SaleNewScreen());
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
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const ProductCard(
                    sale: false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
