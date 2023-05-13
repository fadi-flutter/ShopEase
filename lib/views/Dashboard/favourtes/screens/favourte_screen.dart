import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:shopease/views/Dashboard/favourtes/controllers/favourite_controller.dart';
import 'package:shopease/views/Dashboard/product/screens/product_details.dart';
import 'package:shopease/widgets/product_card.dart';

class FavourteScreen extends StatefulWidget {
  const FavourteScreen({super.key});

  @override
  State<FavourteScreen> createState() => _FavourteScreenState();
}

class _FavourteScreenState extends State<FavourteScreen> {
  final FavouriteController favouriteC = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Favourites',
          style: AppTextStyle.mediumBlack20,
        ),
      ),
      body: StreamBuilder(
        stream: favouriteC.getFavourites(),
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
                    'No Products Found',
                    style: AppTextStyle.regularBlack14,
                  ),
                );
              }
          }
          return Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    border: Border(
                        bottom:
                            BorderSide(color: AppColors.lightGrey, width: 2))),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      spacing: 5,
                      children: [
                        const Icon(Icons.filter_alt),
                        Text(
                          'Filters',
                          style: AppTextStyle.regularBlack16,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          context: context,
                          builder: (BuildContext context) {
                            return Filter(
                              favouriteC: favouriteC,
                            );
                          },
                        );
                      },
                      child: Wrap(
                        spacing: 5,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.arrow_upward),
                              Icon(Icons.arrow_downward),
                            ],
                          ),
                          Text(
                            favouriteC.filterIndex.value == 10
                                ? 'Filter the products'
                                : favouriteC.filterIndex.value == 0
                                    ? 'Customer reviews'
                                    : favouriteC.filterIndex.value == 1
                                        ? 'Price: lowest to high'
                                        : 'Price: highest to low',
                            style: AppTextStyle.regularBlack16,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 310,
                  ),
                  itemBuilder: ((context, index) {
                    //checking when user changes filter
                    favouriteC.filterIndex.listen((p0) {
                      setState(() {});
                    });
                    favouriteC.filterIndex.value == 10
                        //if user have not selected any filter then show normal data
                        ? snapshot.data
                        //if user seleted customers reviews filter
                        : favouriteC.filterIndex.value == 0
                            ? snapshot.data!.sort(
                                ((a, b) => b.reviews!.compareTo(a.reviews!)))
                            //if user seleted price low to high filter
                            : favouriteC.filterIndex.value == 1
                                ? snapshot.data!.sort(((a, b) => a.price!
                                    .toInt()
                                    .compareTo(b.price!.toInt())))
                                //if user seleted price high to low filter
                                : snapshot.data!.sort(((a, b) => b.price!
                                    .toInt()
                                    .compareTo(a.price!.toInt())));
                    return GestureDetector(
                      onTap: () {
                        Get.to(() =>
                            ProductDetails(product: snapshot.data![index]));
                      },
                      child: ProductCard(
                        sale: false,
                        product: snapshot.data![index],
                        stackRemove: true,
                        favourate: true,
                      ),
                    );
                  }),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Filter extends StatelessWidget {
  Filter({
    super.key,
    required this.favouriteC,
  });
  final FavouriteController favouriteC;
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
                      favouriteC.filterIndex(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      color: index == favouriteC.filterIndex.value
                          ? AppColors.primary
                          : AppColors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      child: Text(
                        list[index],
                        style: index == favouriteC.filterIndex.value
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
