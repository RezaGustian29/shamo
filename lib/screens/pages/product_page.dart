import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/config/appcolors.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
  ];

  List familiarShoes = [
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
    'assets/images/image_shoes.png',
  ];

  int currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: currenIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currenIndex == index
              ? AppColors.primaryColor
              : const Color(0xffC4C4C4),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                ),
                const Icon(
                  Icons.shopping_bag,
                  color: AppColors.bgColor1,
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currenIndex = index;
                  });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: AppColors.bgColor1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'TERREX URBAN LOW',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        Text(
                          'Hiking',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/button/button_wishlist.png',
                    width: 46,
                  ),
                ],
              ),
            ),

            //NOTE: PRICE
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.bgColor2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Price starts from',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    '\$143,98',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.priceColor,
                    ),
                  )
                ],
              ),
            ),

            //NOTE: Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.subtitleTextColor,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            //NOTE: FamiliarShoes
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: const Text(
                      'Fimiliar Shoes',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map(
                        (image) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: familiarShoesCard(image),
                          );
                        },
                      ).toList(),
                    ),
                  )
                ],
              ),
            ),

            //NOTE: BUTTONS
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(35),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/button/button_chat.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: AppColors.primaryColor,
                        ),
                        child: Text(
                          'Add toCart',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor6,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
