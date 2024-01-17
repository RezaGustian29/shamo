import 'package:flutter/material.dart';
import 'package:shamo/config/appcolors.dart';
import 'package:shamo/screens/home/home_page.dart';
import 'package:shamo/screens/home/profile_page.dart';
import 'package:shamo/screens/home/wishlits_page.dart';
import 'chat_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
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
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: AppColors.bgColor4,
            currentIndex: currenIndex,
            onTap: (value) {
              setState(() {
                currenIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColors.bgColor4,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    right: 5,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_home.png',
                    width: 22,
                    color: currenIndex == 0
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
                    top: 15,
                    bottom: 10,
                    right: 50,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_chat.png',
                    width: 20,
                    color: currenIndex == 1
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
                    top: 15,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_favorite.png',
                    width: 20,
                    color: currenIndex == 2
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
                    top: 15,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_profile.png',
                    width: 18,
                    color: currenIndex == 3
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
      switch (currenIndex) {
        case 0:
          return const HomePage();
          break;
        case 1:
          return const ChatPage();
          break;
        case 2:
          return const WishlistPage();
          break;
        case 3:
          return const ProfilePage();
          break;
        default:
      }
    }

    return Scaffold(
      backgroundColor:
          currenIndex == 0 ? AppColors.bgColor1 : AppColors.bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: SafeArea(child: body()!),
    );
  }
}
