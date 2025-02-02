import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/appcolors.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/provider/cart_provider.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  const CartCard(this.cart, {super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    //TODO Image

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
                    ),
                    Text(
                      '\$${cart.product.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.priceColor,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/button/button_add.png',
                      width: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/button/button_min.png',
                      width: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/icon_remove.png',
                  width: 10,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'Remove',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColors.alertColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
