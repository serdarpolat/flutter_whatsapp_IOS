import 'package:flutter/material.dart';
import 'package:whatsapp_ui/res/index.dart';

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 240),
      width: s.width,
      height: s.height,
      color: grayBg,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: hh(88)),
            Container(
              width: s.width,
              height: s.width,
              child: Image.asset(
                "assets/images/img1.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: s.width,
              height: hh(63),
              color: white,
              child: padding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Martha Craig",
                          style: med18(color: black),
                        ),
                        SizedBox(height: hh(5)),
                        Text(
                          "+1 202 555 0181",
                          style: reg12(color: iconGrey),
                        ),
                      ],
                    ),
                    Container(
                      width: ww(132),
                      height: hh(36),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: ww(36),
                            height: ww(36),
                            child: Center(
                              child: svgImage(
                                img: "assets/icons/comment.svg",
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
                                img: "assets/icons/video_call_fill.svg",
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
                                img: "assets/icons/phone_alt.svg",
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
              ),
            ),
            padding(
              child: Divider(
                height: 0.5,
                color: iconGrey,
              ),
            ),
            Container(
              width: s.width,
              height: hh(63),
              color: white,
              child: padding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Design adds value faster, than it adds cost",
                      style: reg14(color: black),
                    ),
                    SizedBox(height: hh(5)),
                    Text(
                      "Dec 18, 2020",
                      style: reg12(color: iconGrey),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 0.5,
              color: iconGrey,
            ),
            SizedBox(height: hh(18)),
            Divider(
              height: 0.5,
              color: iconGrey,
            ),
            Container(
              width: s.width,
              height: hh(141),
              color: white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(3, (index) {
                  return infoItem(s,
                      item: infoItems[index], islast: index == 2);
                }),
              ),
            ),
            Divider(
              height: 0.5,
              color: iconGrey,
            ),
            SizedBox(height: hh(18)),
            Divider(
              height: 0.5,
              color: iconGrey,
            ),
            Container(
              width: s.width,
              height: hh(141),
              color: white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(3, (index) {
                  return infoItem(s, item: infoItems[index + 3], islast: false);
                }),
              ),
            ),
            Container(
              width: s.width,
              height: hh(74),
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(ww(9)),
                    child: Container(
                      width: ww(29),
                      height: ww(29),
                      child: Center(
                        child: svgImage(
                          img: "assets/icons/lock.svg",
                          color: white,
                          width: ww(16),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(hh(6)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: hh(47),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Encryption",
                                  style: reg16(color: black),
                                ),
                                Container(
                                  child: Text(
                                    "Message to this chats and calls are secured with end-to-end ecnrypiton. Tap to verify.",
                                    style: reg11(color: textGrey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          svgImage(
                            img: "assets/icons/forward.svg",
                            color: textGrey,
                            height: hh(12),
                          ),
                          SizedBox(width: ww(9)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.5,
              color: iconGrey,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItemModel {
  Color color;
  String img;
  String title;
  String count;

  InfoItemModel(this.color, this.img, this.title, this.count);
}

List<InfoItemModel> infoItems = [
  InfoItemModel(accentColor, "picture_alt", "Media, Links and Docs", "12"),
  InfoItemModel(orangeAccent, "star", "Starred Messages", "None"),
  InfoItemModel(orange, "search", "Chat Search", ""),
  InfoItemModel(darkGreen, "volume", "Mute", "No"),
  InfoItemModel(pink, "note", "Custom Tone", "Default(Note)"),
  InfoItemModel(orangeAccent, "save", "Save to Camera Roll", "Default"),
];

Widget infoItem(Size s, {InfoItemModel item, bool islast}) => Container(
      width: s.width,
      height: hh(47),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(ww(9)),
            child: Container(
              width: ww(29),
              height: ww(29),
              child: Center(
                child: svgImage(
                  img: "assets/icons/${item.img}.svg",
                  color: white,
                  width: ww(16),
                ),
              ),
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(hh(6)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: hh(47),
              child: Row(
                children: [
                  Text(
                    item.title,
                    style: reg16(color: black),
                  ),
                  Spacer(),
                  Text(
                    item.count,
                    style: reg16(color: textGrey),
                  ),
                  SizedBox(width: ww(12)),
                  svgImage(
                    img: "assets/icons/forward.svg",
                    color: textGrey,
                    height: hh(12),
                  ),
                  SizedBox(width: ww(9)),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: islast ? Colors.transparent : iconGrey,
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
