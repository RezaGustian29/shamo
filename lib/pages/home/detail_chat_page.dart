import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/config/appcolors.dart';
import 'package:shamo/config/theme.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/provider/auth_provider.dart';
import 'package:shamo/services/message_services.dart';

import '../../widgets/chat_bubble.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product, {super.key});

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PreferredSizeWidget header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/images/image_shop_logo_online.png',
                width: 50,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    'Online',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.purpleTextColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 75,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.bgColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              //TODO GANTI
              child: Image.asset(
                'assets/images/image_shoes.png',
                width: 54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.name.toString(),
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '\$${widget.product.price}',
                      style: priceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                'assets/button/button_close.png',
                width: 22,
              ),
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.product is UninitializedProductModel
                ? const SizedBox()
                : productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type Message....',
                          hintStyle: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.subtitleTextColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    MessageServices().addMessage(
                      user: authProvider.user,
                      isFromUser: true,
                      message: messageController.text,
                      product: widget.product,
                    );

                    setState(() {
                      widget.product = UninitializedProductModel();
                      messageController.text = '';
                    });
                  },
                  child: Image.asset(
                    'assets/button/button_send.png',
                    width: 45,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
        stream: MessageServices()
            .getMessageByUserId(userId: authProvider.user.id!.toInt()),
        builder: (context, Snapshot) {
          if (Snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              children: Snapshot.data!
                  .map((MessageModel message) => ChatBubble(
                        isSender: message.isFromUser,
                        text: message.message,
                        product: message.product,
                      ))
                  .toList(),
              /* const [
                ChatBubble(
                  isSender: true,
                  text: 'Hi, This item is still available?',
                  hasProduct: true,
                ),
                ChatBubble(
                  isSender: false,
                  text:
                      'Good night, This item is only available in size 42 and 30',
                ),
              ], */
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bgColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
