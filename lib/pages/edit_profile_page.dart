import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/theme.dart';
import 'package:shamo/core.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/provider/auth_provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    PreferredSizeWidget header() {
      return AppBar(
        leading: IconButton(
          color: AppColors.primaryTextColor,
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: primaryTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "${user.name}",
                hintStyle: primaryTextStyle,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.subtitleTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "@${user.username}",
                hintStyle: primaryTextStyle,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.subtitleTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "${user.email}",
                hintStyle: primaryTextStyle,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.subtitleTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/image_profile.png',
                  ),
                ),
              ),
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
