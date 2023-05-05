import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/widgets/long_button.dart';
import 'package:shopease/widgets/product_card.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

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
          'Iphone x',
          style: AppTextStyle.mediumBlack20,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.52,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 4),
                      width: width * 0.7,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/banner.jpeg',
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add to favourtes',
                          style: AppTextStyle.mediumBlack18,
                        ),
                        Material(
                          shadowColor: AppColors.grey,
                          color: AppColors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
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
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 3,
                          children: [
                            SizedBox(
                              width: width * 0.7,
                              child: Text(
                                'Samsung',
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.boldBlack24,
                              ),
                            ),
                            Text(
                              'Galaxy 22 ulta pro',
                              style: AppTextStyle.regularBlack14
                                  .copyWith(color: AppColors.grey),
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
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
                          ],
                        ),
                        Text(
                          '\$ 19.19',
                          style: AppTextStyle.boldBlack24,
                        )
                      ],
                    ),
                    const SizedBox(height: 13),
                    Text(
                      'Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.',
                      style: AppTextStyle.regularBlack14,
                    ),
                    const SizedBox(height: 12),
                    LongButton(
                      onPressed: () {},
                      text: 'ADD TO CART',
                      height: 45,
                    ),
                    const SizedBox(height: 12),
                    Text('You can also like this',
                        style: AppTextStyle.boldBlack18),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ProductCard(
                      sale: false,
                      stackRemove: true,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
