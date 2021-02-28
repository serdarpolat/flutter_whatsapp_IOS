import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/res/index.dart';

class EditChats extends StatelessWidget {
  final PageStates state;

  const EditChats({Key key, this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Consumer<ChatStates>(
      builder: (context, state, child) {
        return Container(
          width: s.width,
          height: hh(140),
          color: white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: hh(46)),
              GestureDetector(
                onTap: () {
                  state.changeOpenEditChats();
                },
                child: Container(
                  padding: EdgeInsets.all(ww(8)),
                  margin: EdgeInsets.only(left: ww(8)),
                  child: Text(
                    "Done",
                    style: semi17(color: accentColor),
                  ),
                ),
              ),
              SizedBox(height: hh(10)),
              padding(
                child: Text(
                  "Chats",
                  style: bold34(color: black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
