import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:shopease/views/Dashboard/cart/controllers/cart_controller.dart';
import 'package:shopease/widgets/operation_button.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  CartItem({
    super.key,
    required this.product,
    required this.cartC,
  });
  final Products product;
  final CartController cartC;
  List optionsList = <String>['Add to favourites', 'Remove from cart'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 19),
      height: 130,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      product.thumbnail!,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          width: 170,
                          child: Text(
                            product.title!,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.mediumBlack16,
                          ),
                        ),
                        Text(
                          product.brand!,
                          style: AppTextStyle.regularBlack12
                              .copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        OperationButton(
                          icon: Icons.remove,
                          onPressed: () {
                            if (product.quantity! > 1) {
                              cartC.removeQuantity(product);
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          child: Text(
                            product.quantity!.toString(),
                            style: AppTextStyle.regularBlack16,
                          ),
                        ),
                        OperationButton(
                          icon: Icons.add,
                          onPressed: () {
                            cartC.addQuantity(product);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 5, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  itemBuilder: (BuildContext context) {
                    return optionsList.map((e) {
                      return PopupMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: AppTextStyle.mediumBlack16,
                        ),
                      );
                    }).toList();
                  },
                  onSelected: (value) {},
                ),
                Text(
                  '\$ ${product.price}',
                  style: AppTextStyle.mediumBlack16,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
