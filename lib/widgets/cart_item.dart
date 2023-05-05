import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/widgets/operation_button.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  CartItem({
    super.key,
  });
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/banner.jpeg',
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
                            'Pull Over Pull OverPull Over',
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.mediumBlack16,
                          ),
                        ),
                        Text(
                          'Brand name',
                          style: AppTextStyle.regularBlack12
                              .copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const OperationButton(icon: Icons.remove),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          child: Text(
                            '12',
                            style: AppTextStyle.regularBlack16,
                          ),
                        ),
                        const OperationButton(icon: Icons.add),
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
                  '\$55',
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
