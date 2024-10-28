import 'package:flutter/material.dart';
import 'package:shamo/config/appcolors.dart';
import 'package:shamo/models/cart_model.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  const CheckoutCard(this.cart, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
          color: AppColors.bgColor4, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                //TODOS Image Dinamis
                image: AssetImage('assets/images/image_shoes.png'),
              ),
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
                  cart.product.name.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${cart.product.price}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.priceColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${cart.quantity}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: AppColors.secondaryTextColor,
            ),
          )
        ],
      ),
    );
  }
}
