import 'package:ecommerce_elk/core/constant/app_assets.dart';
import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:ecommerce_elk/features/cart/presentation/view/cart_screen.dart';
import 'package:ecommerce_elk/features/home/presentation/view/home_screen.dart';
import 'package:ecommerce_elk/features/profile/presentation/view/profile_screen.dart';
import 'package:flutter/material.dart';


import 'package:flutter_svg/svg.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _iconBar(SvgAssets.homeSvg),
            activeIcon: _activeIconBar(SvgAssets.homeSvg),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: _iconBar(SvgAssets.cartSvg),
            activeIcon: _activeIconBar(SvgAssets.cartSvg),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: _iconBar(SvgAssets.profileSvg),
            activeIcon: _activeIconBar(SvgAssets.profileSvg),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _iconBar(String image) {
    return SvgPicture.asset(image, height: 27, width: 27);
  }

  Widget _activeIconBar(String image) {
    return SvgPicture.asset(
      image,
      height: 27,
      width: 27,
      color: AppColors.pink[AppColors.colorCode50]!,
    );
  }
}
