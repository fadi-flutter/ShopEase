import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Dashboard/shop/screens/category_screen.dart';
import 'package:shopease/widgets/auth_textfield.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final category = <String>[
    'Tops',
    'Shirts & Blousers',
    'Knitwear',
    'Blazers',
    'Outerwears',
    'Pants',
    'Jeans'
  ];
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
          'Categories',
          style: AppTextStyle.mediumBlack20,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Column(
            children: [
              const AuthTextField(
                  text: 'Search Category', trailing: Icons.search),
              const SizedBox(height: 8),
              Text(
                'Choose category',
                style:
                    AppTextStyle.mediumBlack16.copyWith(color: AppColors.grey),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: category.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const CategoryScreen());
                      },
                      child: Card(
                        elevation: 1,
                        shadowColor: AppColors.lightGrey,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 18),
                          child: Text(
                            category[index],
                            style: AppTextStyle.regularBlack16,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
