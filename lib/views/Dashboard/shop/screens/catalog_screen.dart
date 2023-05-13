import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Auth/models/products_model.dart';
import 'package:shopease/views/Dashboard/product/screens/product_details.dart';
import 'package:shopease/views/Dashboard/shop/controllers/catalog_controller.dart';
import 'package:shopease/views/Dashboard/shop/screens/categories_screen.dart';
import 'package:shopease/widgets/price_filter.dart';
import 'package:shopease/widgets/product_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final CatalogController catalogC = Get.put(CatalogController());

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CategoriesScreen(catalogC: catalogC));
            },
            icon: const Icon(Icons.search, size: 26, color: AppColors.black),
          )
        ],
        title: Text(
          'Search By Category',
          style: AppTextStyle.mediumBlack20,
        ),
      ),
      body: FutureBuilder<List<Products>>(
        future: catalogC.getProducts(),
        builder: (context, snapshot) {
          
          return snapshot.hasData
              ? StreamBuilder(
                stream: catalogC.getFavourites(),
                builder: (context,AsyncSnapshot <List<String>> snap) {
                  return snap.hasData? Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.white,
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.lightGrey, width: 2))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
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
                                      return PriceFilter(
                                        catalogC: catalogC,
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
                                      catalogC.filterIndex.value == 10
                                          ? 'Filter the products'
                                          : catalogC.filterIndex.value == 0
                                              ? 'Customer reviews'
                                              : catalogC.filterIndex.value == 1
                                                  ? 'Price: lowest to high'
                                                  : 'Price: highest to low',
                                      style: AppTextStyle.regularBlack16,
                                    ),
                                    const SizedBox(
                                      width: 06,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 3),
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 310,
                            ),
                            itemBuilder: ((context, index) {
                              //checking when user changes filter
                              catalogC.filterIndex.listen((p0) {
                                setState(() {});
                              });
                              catalogC.filterIndex.value == 10
                                  //if user have not selected any filter then show normal data
                                  ? snapshot.data
                                  //if user seleted customers reviews filter
                                  : catalogC.filterIndex.value == 0
                                      ? snapshot.data!.sort(((a, b) =>
                                          b.reviews!.compareTo(a.reviews!)))
                                      //if user seleted price low to high filter
                                      : catalogC.filterIndex.value == 1
                                          ? snapshot.data!.sort(((a, b) => a.price!
                                              .toInt()
                                              .compareTo(b.price!.toInt())))
                                          //if user seleted price high to low filter
                                          : snapshot.data!.sort(((a, b) => b.price!
                                              .toInt()
                                              .compareTo(a.price!.toInt())));
                              return GestureDetector(
                                onTap: () {
                                        Get.to(() => ProductDetails(
                                            product: snapshot.data![index]));
                                      },
                                child: ProductCard(
                                  sale: false,
                                  product: snapshot.data![index],
                                  stackRemove: true,
                                  favourate: snap.data!
                                                          .contains(snapshot.data![index].id!.toString()),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ) : const Center(
                  child: CircularProgressIndicator(),
                );
                }
              )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
