import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_ui/res/index.dart';

Widget appBar(BuildContext context,
        {Function onTap, ChatStates state, Function openEditContact}) =>
    Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width,
      height: hh(88),
      color: barGrey,
      child: padding(
        child: state.openContactInfo
            ? Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        state.changeOpenContactInfo();
                      },
                      child: Container(
                        width: ww(375 - 32.0) / 3,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: ww(0)),
                              child: Row(
                                children: [
                                  svgImage(
                                    img: "assets/icons/back.svg",
                                    color: accentColor,
                                    width: ww(11.84),
                                    height: hh(21),
                                  ),
                                  SizedBox(width: ww(5)),
                                  Text(
                                    "Martha Craig",
                                    style: reg17(color: accentColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: ww(375 - 32.0) / 3,
                      child: Center(
                        child: Text(
                          "Contact Info",
                          style: semi17(color: black),
                        ),
                      ),
                    ),
                    Container(
                      width: ww(375 - 32.0) / 3,
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: openEditContact,
                        child: Container(
                          child: Text(
                            "Edit",
                            style: reg17(color: accentColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : state.openChatDetail
                ? Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          color: accentColor,
                          onPressed: () {
                            state.changeOpenChatDetail();
                          }),
                      GestureDetector(
                        onTap: () {
                          state.changeOpenContactInfo();
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                width: ww(36),
                                height: ww(36),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/u4.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: ww(8)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Martha Craig",
                                    style: semi16(color: black),
                                  ),
                                  Text(
                                    "tap here for contact info",
                                    style: reg12(color: black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            width: ww(36),
                            height: ww(36),
                            child: MaterialButton(
                              padding: const EdgeInsets.all(0.0),
                              elevation: 0,
                              onPressed: () {},
                              shape: CircleBorder(),
                              color: barGrey,
                              textColor: accentColor,
                              child: Center(
                                child: svgImage(
                                  img: "assets/icons/video_call.svg",
                                  width: ww(25),
                                  height: hh(16),
                                  label: "Video Call",
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: ww(36),
                            height: ww(36),
                            child: MaterialButton(
                              padding: const EdgeInsets.all(0.0),
                              elevation: 0,
                              onPressed: () {},
                              shape: CircleBorder(),
                              color: barGrey,
                              textColor: accentColor,
                              child: Center(
                                child: svgImage(
                                  img: "assets/icons/phone_call.svg",
                                  width: ww(21),
                                  height: hh(21),
                                  label: "Video Call",
                                  color: accentColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          child: Text(
                            "Edit",
                            style: reg17(color: accentColor),
                          ),
                        ),
                      ),
                      Text(
                        "Chats",
                        style: semi17(color: black),
                      ),
                      svgImage(
                        img: "assets/icons/edit.svg",
                        width: ww(23),
                        height: ww(23),
                        label: 'Edit Icon',
                      ),
                    ],
                  ),
      ),
    );

Widget padding({Widget child}) =>
    Padding(padding: EdgeInsets.symmetric(horizontal: ww(16)), child: child);

Widget paddingLeft({Widget child}) =>
    Padding(padding: EdgeInsets.only(left: ww(16)), child: child);

Widget svgImage(
        {String img, String label, double width, double height, Color color}) =>
    SvgPicture.asset(
      img,
      semanticsLabel: label,
      width: width,
      height: height,
      color: color == null ? accentColor : color,
    );

Future<dynamic> pushToPage(BuildContext context, Widget page) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));

void pop(BuildContext context) => Navigator.of(context).pop();
