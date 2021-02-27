import 'package:flutter/material.dart';
import 'package:whatsapp_ui/res/index.dart';

class ChatDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      decoration: BoxDecoration(
        color: white,
        image: DecorationImage(
          image: AssetImage("assets/images/chat_bg.png"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: hh(88)),
          ...List.generate(messages.length, (index) {
            return messageItem(
              s,
              item: messages[index],
            );
          }),
          SizedBox(height: hh(60 + 2.0)),
        ],
      ),
    );
  }
}

class MessageModel {
  String inOut;
  String type; // Text, Voice, Video, Doc
  String message;

  MessageModel({this.inOut, this.type, this.message});
}

List<MessageModel> messages = [
  MessageModel(
      inOut: "in", type: "text", message: "Do you know what time is it?"),
  MessageModel(inOut: "out", type: "text", message: "It's morning in Tokyo"),
  MessageModel(
      inOut: "in",
      type: "text",
      message: "What is the most popular meal in Japan?"),
  MessageModel(inOut: "in", type: "text", message: "Do you like it?"),
  MessageModel(inOut: "out", type: "text", message: "I think top two are."),
];

Widget messageItem(Size s, {MessageModel item}) => Container(
      width: ww(375 - 32.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: hh(2)),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              bottom: 0,
              left: item.inOut == "in" ? -ww(8.5) : s.width - ww(32 + 8.5),
              child: Container(
                child: svgImage(
                  img: item.inOut == "in"
                      ? "assets/icons/notch_left.svg"
                      : "assets/icons/notch_right.svg",
                  color: item.inOut == "in" ? white : lightGreen,
                  height: hh(19.5),
                ),
              ),
            ),
            Container(
              width: s.width,
              child: Align(
                alignment: item.inOut == "in"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  constraints: BoxConstraints(maxWidth: ww(250)),
                  padding:
                      EdgeInsets.symmetric(horizontal: ww(7), vertical: hh(5)),
                  child: item.type == "text"
                      ? Text(
                          item.message,
                          style: reg16(color: black),
                        )
                      : Container(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(hh(8)),
                    color: item.inOut == "in" ? white : lightGreen,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget writeMessageActions(Size s) => Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: s.width,
        height: hh(60),
        color: barGrey,
        padding: EdgeInsets.only(left: ww(8), right: ww(8)),
        child: Container(
          child: Row(
            children: [
              Container(
                width: ww(32),
                height: ww(32),
                child: MaterialButton(
                  padding: const EdgeInsets.all(8.0),
                  elevation: 0,
                  onPressed: () {},
                  shape: CircleBorder(),
                  color: barGrey,
                  textColor: accentColor,
                  child: Center(
                    child: svgImage(
                      img: "assets/icons/add.svg",
                      width: ww(24),
                      height: hh(24),
                      label: "Video Call",
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: ww(228),
                height: hh(32),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: textGrey,
                    width: 0.5,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          filled: true,
                          fillColor: white,
                        ),
                      ),
                    ),
                    Container(
                      width: ww(32),
                      height: ww(32),
                      child: MaterialButton(
                        padding: const EdgeInsets.all(5.0),
                        elevation: 0,
                        onPressed: () {},
                        shape: CircleBorder(),
                        color: white,
                        textColor: accentColor,
                        child: Center(
                          child: svgImage(
                            img: "assets/icons/stickers.svg",
                            width: ww(22),
                            height: hh(19),
                            label: "Video Call",
                            color: accentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: ww(32),
                height: ww(32),
                child: MaterialButton(
                  padding: const EdgeInsets.all(8.0),
                  elevation: 0,
                  onPressed: () {},
                  shape: CircleBorder(),
                  color: barGrey,
                  textColor: accentColor,
                  child: Center(
                    child: svgImage(
                      img: "assets/icons/camera_normal_bordered.svg",
                      width: ww(22),
                      height: hh(19),
                      label: "Video Call",
                      color: accentColor,
                    ),
                  ),
                ),
              ),
              Container(
                width: ww(40),
                height: ww(40),
                child: MaterialButton(
                  padding: const EdgeInsets.all(8.0),
                  elevation: 0,
                  onPressed: () {},
                  shape: CircleBorder(),
                  color: barGrey,
                  textColor: accentColor,
                  child: Center(
                    child: svgImage(
                      img: "assets/icons/RecordAudio.svg",
                      width: ww(16),
                      height: hh(24),
                      label: "Video Call",
                      color: accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
