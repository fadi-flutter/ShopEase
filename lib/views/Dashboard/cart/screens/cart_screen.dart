import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:shopease/views/Dashboard/cart/controllers/cart_controller.dart';
import 'package:shopease/widgets/cart_item.dart';
import 'package:shopease/widgets/long_button.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final CartController cartC = Get.put(CartController());
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
        child: StreamBuilder(
            stream: cartC.getProducts(),
            builder: (context, AsyncSnapshot<List<Products>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: SizedBox(
                      height: 28,
                      width: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Please check your internet connection\nand try again!',
                        style: AppTextStyle.regularBlack14,
                      ),
                    );
                  }
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'Your bag is empty ',
                        style: AppTextStyle.regularBlack14,
                      ),
                    );
                  }
              }
              int total = 0;
              for (var element in snapshot.data!) {
                total += element.price! * element.quantity!;
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return CartItem(
                          product: snapshot.data![index],
                          cartC: cartC,
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 15),
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
                            Text('\$ $total', style: AppTextStyle.boldBlack20),
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
              );
            }),
      ),
    );
  }
}
