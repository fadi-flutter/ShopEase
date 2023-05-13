import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:shopease/views/Dashboard/product/controllers/product_controller.dart';
import 'package:shopease/widgets/long_button.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails(
      {super.key,
      required this.product,
      required this.productC,
      this.sale = false});
  final Products product;
  final ProductController productC;
  final bool sale;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.black),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          product.title!.capitalize!,
          style: AppTextStyle.mediumBlack20,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: StreamBuilder(
              stream: productC.getFavourites(),
              builder: (context, AsyncSnapshot<List<String>> snap) {
                return snap.hasData
                    ? Column(
                        children: [
                          SizedBox(
                            height: height * 0.52,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: product.images!.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  width: width * 0.7,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        product.images![index],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Add to favourtes',
                                      style: AppTextStyle.mediumBlack18,
                                    ),
                                    Material(
                                      shadowColor: AppColors.grey,
                                      color: AppColors.white,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      elevation: 4,
                                      child: GestureDetector(
                                        onTap: () {
                                          snap.data!.contains(
                                                  product.id.toString())
                                              ? productC
                                                  .removeToFavourites(product)
                                              : ProductController
                                                  .addToFavourite(product);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Icon(
                                            snap.data!.contains(
                                                    product.id.toString())
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            size: 20,
                                            color: snap.data!.contains(
                                                    product.id.toString())
                                                ? AppColors.primary
                                                : AppColors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      direction: Axis.vertical,
                                      spacing: 3,
                                      children: [
                                        SizedBox(
                                          width: width * 0.7,
                                          child: Text(
                                            product.brand!.capitalize!,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyle.boldBlack24,
                                          ),
                                        ),
                                        Text(
                                          product.title!.capitalize!,
                                          style: AppTextStyle.regularBlack14
                                              .copyWith(color: AppColors.grey),
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating:
                                                  product.rating!.toDouble(),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 15,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                            const SizedBox(width: 3),
                                            Text(
                                              '(${product.reviews!})',
                                              style: AppTextStyle.regularWhite12
                                                  .copyWith(
                                                      color: AppColors.grey),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      sale
                                          ? ' \$${(product.price! - product.price! * product.discountPercentage! ~/ 100).toInt()} '
                                          : '\$ ${product.price}',
                                      style: AppTextStyle.boldBlack24,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 13),
                                Text(
                                  product.description!.capitalize!,
                                  style: AppTextStyle.regularBlack14,
                                ),
                                const SizedBox(height: 12),
                                LongButton(
                                  onPressed: () {},
                                  text: 'ADD TO CART',
                                  height: 45,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
