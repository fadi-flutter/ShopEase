import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/models/products_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.sale,
    this.newItem = false,
    this.stackRemove = false,
    this.favourate = false,
    this.showHeart = false,
    this.product,
  });
  final bool sale;
  final bool newItem;
  final bool? stackRemove;
  final bool? favourate;
  final bool? showHeart;
  final Products? product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: AppColors.white,
      ),
      width: 155,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(product!.thumbnail!),
                      ),
                    ),
                  ),
                  stackRemove!
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          margin: const EdgeInsets.only(top: 9, left: 9),
                          decoration: BoxDecoration(
                              color:
                                  newItem ? AppColors.black : AppColors.primary,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            newItem
                                ? ' NEW '
                                : '${product!.discountPercentage!.toInt()}% off',
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
                      initialRating: product!.rating!.toDouble(),
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
                      '(${product!.reviews!})',
                      style: AppTextStyle.regularWhite12
                          .copyWith(color: AppColors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Text(
                product!.brand!,
                overflow: TextOverflow.ellipsis,
                style:
                    AppTextStyle.regularBlack14.copyWith(color: AppColors.grey),
              ),
              Text(product!.title!,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.boldBlack16),
              const SizedBox(height: 3),
              Row(
                children: [
                  sale
                      ? Text(
                          '\$${product!.price.toString()}',
                          style: AppTextStyle.regularBlack14.copyWith(
                              color: AppColors.grey,
                              decoration: TextDecoration.lineThrough),
                        )
                      : Container(),
                  Text(
                    ' \$${(product!.price! - product!.price! * product!.discountPercentage! ~/ 100).toInt()}',
                    style: AppTextStyle.regularBlack14
                        .copyWith(color: AppColors.primary),
                  ),
                ],
              )
            ],
          ),
          showHeart!
              ? Padding(
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
                        favourate! ? Icons.favorite : Icons.favorite_outline,
                        size: 19,
                        color: favourate! ? AppColors.primary : AppColors.grey,
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
