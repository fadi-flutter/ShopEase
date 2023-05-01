import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.sale,
    this.newItem = false,
  });
  final bool sale;
  final bool newItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: AppColors.white,
      width: 155,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/banner.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    margin: const EdgeInsets.only(top: 9, left: 9),
                    decoration: BoxDecoration(
                        color: newItem ? AppColors.black : AppColors.primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      newItem ? ' NEW ' : '- 20%',
                      style: AppTextStyle.regularWhite12,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '(10)',
                      style: AppTextStyle.regularWhite12
                          .copyWith(color: AppColors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Brand Name',
                overflow: TextOverflow.ellipsis,
                style:
                    AppTextStyle.regularBlack14.copyWith(color: AppColors.grey),
              ),
              Text('Evening Dress Evening DresEvening Dres',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.boldBlack16),
              const SizedBox(height: 3),
              Row(
                children: [
                  sale
                      ? Text(
                          '\$50  ',
                          style: AppTextStyle.regularBlack14.copyWith(
                              color: AppColors.grey,
                              decoration: TextDecoration.lineThrough),
                        )
                      : Container(),
                  Text(
                    '\$40 ',
                    style: AppTextStyle.regularBlack14
                        .copyWith(color: AppColors.primary),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 95),
            child: Material(
              shadowColor: AppColors.grey,
              color: AppColors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              elevation: 4,
              child: Container(
                padding: const EdgeInsets.all(7),
                child: Icon(
                  Icons.favorite_outline,
                  size: 19,
                  color: AppColors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
