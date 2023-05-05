import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/widgets/cart_item.dart';
import 'package:shopease/widgets/long_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'My Bag',
          style: AppTextStyle.mediumBlack20,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: 2,
                itemBuilder: ((context, index) {
                  return CartItem();
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total amount:',
                        style: AppTextStyle.mediumBlack16
                            .copyWith(color: AppColors.grey),
                      ),
                      Text('\$55', style: AppTextStyle.boldBlack20),
                    ],
                  ),
                  const SizedBox(height: 18),
                  LongButton(
                    onPressed: () {},
                    text: 'CHECK OUT',
                    height: 45,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
