import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/widgets/price_filter.dart';
import 'package:shopease/widgets/product_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: AppColors.black),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 1,
        title: Text(
          'Mens Jeans',
          style: AppTextStyle.mediumBlack20,
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(
                    bottom: BorderSide(color: AppColors.lightGrey, width: 2))),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 5,
                  children: [
                    const Icon(Icons.filter_alt),
                    Text(
                      'Filters',
                      style: AppTextStyle.regularBlack16,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      context: context,
                      builder: (BuildContext context) {
                        return PriceFilter();
                      },
                    );
                  },
                  child: Wrap(
                    spacing: 5,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.arrow_upward),
                          Icon(Icons.arrow_downward),
                        ],
                      ),
                      Text(
                        'Price lowest to high',
                        style: AppTextStyle.regularBlack16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 310,
              ),
              itemBuilder: ((context, index) {
                return const ProductCard(
                  sale: false,
                  stackRemove: true,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
