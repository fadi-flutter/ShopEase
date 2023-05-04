import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';
import 'package:shopease/utilities/app_textstyle.dart';
import 'package:shopease/views/Dashboard/home/screens/home.dart';
import 'package:shopease/views/Dashboard/shop/screens/catalog_screen.dart';
import 'package:shopease/views/Dashboard/shop/screens/categories_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;
  List pages = [
    const Home(),
    const CatalogScreen(),
    const Home(),
    const Home(),
    const Home(),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: pages[index],
      bottomNavigationBar: Container(
        width: width,
        height: 60,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MenuItem(
              text: '   Home  ',
              icon: Icons.home,
              isActive: index == 0 ? true : false,
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            MenuItem(
              text: '   Shop  ',
              icon: Icons.shopping_cart_outlined,
              isActive: index == 1 ? true : false,
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            MenuItem(
              text: '   Bag   ',
              icon: Icons.shopping_bag_outlined,
              isActive: index == 2 ? true : false,
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
            ),
            MenuItem(
              text: 'Favourtes',
              icon: Icons.favorite_outline,
              isActive: index == 3 ? true : false,
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
            ),
            MenuItem(
              text: '  Profile  ',
              icon: Icons.account_circle_outlined,
              isActive: index == 4 ? true : false,
              onTap: () {
                setState(() {
                  index = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.isActive,
    this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final bool isActive;
  final Function()? onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: isActive ? AppColors.primary : AppColors.grey,
          ),
          Text(text,
              style: AppTextStyle.regularBlack12.copyWith(
                color: isActive ? AppColors.primary : AppColors.grey,
              ))
        ],
      ),
    );
  }
}
