import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/appcolors.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/provider/wishlist_provider.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  const WishlistCard(this.product, {super.key});
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.only(
        left: 12,
        right: 20,
        top: 10,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.bgColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/image_shoes.png',
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.priceColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/button/button_wishlist_blue.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
