import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/appcolors.dart';
import 'package:shamo/config/theme.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/provider/auth_provider.dart';
import 'package:shamo/provider/page_provider.dart';
import 'package:shamo/services/message_services.dart';

import '../../widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header() {
      return AppBar(
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: bgColor1,
      );
    }

    // ignore: unused_element
    Widget emptyChat() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: AppColors.bgColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/icon_headset.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Opss no message yet?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryTextColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 44,
              child: TextButton(
                onPressed: () {
                  pageProvider.currentIndex = 0;
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageServices()
              .getMessageByUserId(userId: authProvider.user.id!.toInt()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return emptyChat();
              }
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  width: double.infinity,
                  color: AppColors.bgColor3,
                  child: ListView(
                    children: [
                      ChatTile(snapshot.data![snapshot.data!.length - 1]),
                    ],
                  ),
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
