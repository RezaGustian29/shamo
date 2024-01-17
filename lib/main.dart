import 'package:shamo/core.dart';
import 'package:flutter/material.dart';
import 'package:shamo/screens/auth/sign_in_screen.dart';
import 'package:shamo/screens/auth/sign_up_screen.dart';
import 'package:shamo/screens/home/detail_chat_page.dart';
import 'package:shamo/screens/home/main_page.dart';
import 'package:shamo/screens/pages/edit_profile_page.dart';
import 'package:shamo/screens/pages/product_page.dart';

import 'screens/pages/cart_page.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/home': (context) => const MainPage(),
        '/detail-chat': (context) => const DetailChatPage(),
        '/edit-page': (context) => const EditProfilePage(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
