import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/appcolors.dart';
import 'package:shamo/config/theme.dart';
import 'package:shamo/provider/page_provider.dart';
import 'package:shamo/provider/wishlist_provider.dart';

import '../../widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: const Text(
          'Favorite Shoes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    // ignore: unused_element
    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: AppColors.bgColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/image_wishlist.png',
                width: 74,
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                'You don\'t have dream shoes?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Let\'s find you favorit shoes',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Explore Store',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: AppColors.bgColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: wishlistProvider.wishlist
                .map((product) => WishlistCard(product))
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        //emptyWishlist(),
        wishlistProvider.wishlist.isEmpty ? emptyWishlist() : content(),
      ],
    );
  }
}
