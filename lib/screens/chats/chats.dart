import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/res/index.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Consumer<ChatStates>(
      builder: (context, state, child) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: state.openEditChats ? hh(140) : hh(88)),
              Container(
                width: s.width,
                color: white,
                height: hh(44),
                child: padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Boradcast Lists",
                        style: reg17(
                            color:
                                state.openEditChats ? textGrey : accentColor),
                      ),
                      Text(
                        "New Group",
                        style: reg17(
                            color:
                                state.openEditChats ? textGrey : accentColor),
                      ),
                    ],
                  ),
                ),
              ),
              ...List.generate(chatData.length, (index) {
                return ChatListItem(
                  item: chatData[index],
                );
              }),
              SizedBox(height: hh(83)),
            ],
          ),
        );
      },
    );
  }
}
