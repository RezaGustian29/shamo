import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/theme.dart';
import 'package:shamo/provider/product_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/sign-in');

    /*  Timer(
      const Duration(seconds: 3),
      () => ,
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/image_splash.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
