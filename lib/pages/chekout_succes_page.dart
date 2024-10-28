import 'package:flutter/material.dart';
import 'package:shamo/config/theme.dart';
import 'package:shamo/core.dart';

class ChekoutSuccesPage extends StatefulWidget {
  const ChekoutSuccesPage({super.key});

  @override
  State<ChekoutSuccesPage> createState() => _ChekoutSuccesPageState();
}

class _ChekoutSuccesPageState extends State<ChekoutSuccesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }

  PreferredSizeWidget header() {
    return AppBar(
      backgroundColor: bgColor1,
      centerTitle: true,
      title: Text(
        'Chekout Success',
        style: primaryTextStyle.copyWith(
          fontWeight: medium,
        ),
      ),
      elevation: 0,
    );
  }

  Widget content() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/icon_empty_cart.png',
            width: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'You made a transaction',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Stay at home while we\nprepare your dream shoes',
            style: secondaryTextStyle,
            textAlign: TextAlign.center,
          ),
          Container(
            width: 194,
            height: 44,
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Order Other Shoes',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
          Container(
            width: 194,
            height: 44,
            margin: const EdgeInsets.only(
              top: 12,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff393748),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(
                'View My Order',
                style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    color: const Color(0xffB7B6BF)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
