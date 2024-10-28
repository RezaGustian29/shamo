import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/appcolors.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlits_page.dart';
import 'package:shamo/provider/page_provider.dart';
import 'chat_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: AppColors.secondaryColor,
        child: Image.asset(
          'assets/icons/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: AppColors.bgColor4,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: AppColors.bgColor4,
            elevation: 0,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColors.bgColor4,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                    right: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_home.png',
                    width: 20,
                    color: pageProvider.currentIndex == 0
                        ? AppColors.primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.bgColor4,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                    right: 50,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_chat.png',
                    width: 20,
                    color: pageProvider.currentIndex == 1
                        ? AppColors.primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.bgColor4,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                    left: 30,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_favorite.png',
                    width: 20,
                    color: pageProvider.currentIndex == 2
                        ? AppColors.primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.bgColor4,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_profile.png',
                    width: 15,
                    color: pageProvider.currentIndex == 3
                        ? AppColors.primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget? body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return null;
      }
    }

    return Scaffold(
      backgroundColor: pageProvider.currentIndex == 0
          ? AppColors.bgColor1
          : AppColors.bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: SafeArea(child: body()!),
    );
  }
}
