import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/widgets/product_card.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.black),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 26, color: AppColors.black),
          )
        ],
        title: Text(
          'Search By Category',
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

// ignore: must_be_immutable
class PriceFilter extends StatelessWidget {
  PriceFilter({
    super.key,
  });
  List list = <String>[
    'Customer review',
    'Price: lowest to high',
    'Price: highest to low'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              'Sort by',
              style: AppTextStyle.mediumBlack20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: ((context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  color: index == 1 ? AppColors.primary : AppColors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Text(
                    list[index],
                    style: index == 1
                        ? AppTextStyle.regularWhite16
                        : AppTextStyle.regularBlack16,
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
