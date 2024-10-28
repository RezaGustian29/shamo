import 'package:flutter/material.dart';
import 'package:shamo/config/appcolors.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard(this.product, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/image_shoes.png',
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            /*   Image.network(
              product.galleries![0].url,
              width: 215,
              height: 150,
              fit: BoxFit.cover,
              scale: 1.0,
            ), */
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category!.name!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  Text(
                    product.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextStyle,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.priceColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
