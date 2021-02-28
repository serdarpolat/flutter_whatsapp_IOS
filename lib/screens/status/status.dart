import 'package:flutter/material.dart';
import 'package:whatsapp_ui/res/index.dart';

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      color: grayBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: hh(123)),
          Container(
            width: s.width,
            height: hh(76),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: ww(58),
                      height: ww(58),
                      margin: EdgeInsets.only(left: ww(13), right: ww(9)),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: ww(20),
                              height: ww(20),
                              child: Center(
                                child: svgImage(
                                  img: "assets/icons/add.svg",
                                  color: white,
                                  height: hh(12),
                                ),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/u4.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "My Status",
                          style: semi16(color: black),
                        ),
                        SizedBox(height: hh(4)),
                        Text(
                          "Add to my status",
                          style: reg14(color: textGrey),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: ww(88),
                  margin: EdgeInsets.only(right: ww(13)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: ww(36),
                        height: ww(36),
                        child: Center(
                          child: svgImage(
                            img: "assets/icons/camera_normal.svg",
                            width: ww(18),
                            color: accentColor,
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: grayBg,
                        ),
                      ),
                      Container(
                        width: ww(36),
                        height: ww(36),
                        child: Center(
                          child: svgImage(
                            img: "assets/icons/edit_alt.svg",
                            width: ww(18),
                            color: accentColor,
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: grayBg,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: white,
              border: Border(
                top: BorderSide(
                  color: iconGrey,
                  width: 0.5,
                ),
                bottom: BorderSide(
                  color: iconGrey,
                  width: 0.5,
                ),
              ),
            ),
          ),
          SizedBox(height: hh(35)),
          Container(
            width: s.width,
            height: hh(43),
            color: white,
            child: Center(
              child: Text(
                "No recent updates to show right now.",
                style: reg14(color: textGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget statusAppbar(BuildContext context, Size s) => Container(
      width: s.width,
      height: hh(88),
      color: barGrey,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: ww(343 - 16.0) / 3,
            child: paddingLeft(
              child: Text(
                "Privacy",
                style: reg17(color: accentColor),
              ),
            ),
          ),
          Container(
            width: ww(343 - 16.0) / 3,
            child: Center(
              child: Text(
                "Status",
                style: semi17(color: black),
              ),
            ),
          ),
          Container(
            width: ww(343 - 16.0) / 3,
          ),
        ],
      ),
    );
