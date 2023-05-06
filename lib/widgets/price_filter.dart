import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Dashboard/shop/controllers/catalog_controller.dart';

// ignore: must_be_immutable
class PriceFilter extends StatelessWidget {
  PriceFilter({
    super.key,
    this.catalogC,
  });
  final CatalogController? catalogC;
  List list = <String>[
    'Customer reviews',
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
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      catalogC!.filterIndex(index);
                      catalogC!.getProducts();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      color: index == catalogC!.filterIndex.value
                          ? AppColors.primary
                          : AppColors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      child: Text(
                        list[index],
                        style: index == catalogC!.filterIndex.value
                            ? AppTextStyle.regularWhite16
                            : AppTextStyle.regularBlack16,
                      ),
                    ),
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
