import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shamo/core.dart';
import 'package:flutter/material.dart';
import 'package:shamo/pages/chekout_succes_page.dart';
import 'package:shamo/pages/pages/chekout_page.dart';

import 'package:shamo/pages/edit_profile_page.dart';
import 'package:shamo/provider/auth_provider.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/provider/page_provider.dart';
import 'package:shamo/provider/product_provider.dart';
import 'package:shamo/provider/transaction_provider.dart';
import 'package:shamo/provider/wishlist_provider.dart';

import 'pages/cart_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInScreen(),
          '/sign-up': (context) => const SignUpScreen(),
          '/home': (context) => const MainPage(),
          //'/detail-chat': (context) => const DetailChatPage(),
          '/edit-page': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          //'/product': (context) => ProductPage(),
          '/chekout': (context) => const ChekoutPage(),
          '/chekout-success': (context) => const ChekoutSuccesPage(),
        },
      ),
    );
  }
}
