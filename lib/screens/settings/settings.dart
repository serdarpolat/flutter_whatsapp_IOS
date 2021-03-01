import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/res/index.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      color: grayBg,
      child: Column(
        children: [
          SizedBox(height: hh(88)),
          Container(
            width: s.width,
            height: hh(76),
            color: white,
            child: Row(
              children: [
                SizedBox(width: ww(16)),
                Container(
                  width: ww(58),
                  height: ww(58),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/u4.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: ww(12)),
                SizedBox(width: ww(12)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Maariah",
                      style: reg20(color: black),
                    ),
                    Text(
                      "Digital goodies designer - Pixsellz",
                      style: reg16(color: textGrey),
                    ),
                  ],
                ),
                Spacer(),
                svgImage(
                  img: "assets/icons/forward.svg",
                  color: textGrey,
                  height: hh(12),
                ),
                SizedBox(width: ww(16)),
              ],
            ),
          ),
          SizedBox(height: hh(35)),
          Container(
            width: s.width,
            height: hh(95),
            child: Column(
              children: List.generate(2, (index) {
                return infoItem(s,
                    item: settingItems[index], islast: index == 1);
              }),
            ),
            decoration: BoxDecoration(
              color: white,
              border: Border(
                top: BorderSide(color: iconGrey, width: hh(0.5)),
                bottom: BorderSide(color: iconGrey, width: hh(0.5)),
              ),
            ),
          ),
          SizedBox(height: hh(35)),
          Container(
            width: s.width,
            height: hh(189),
            child: Column(
              children: List.generate(4, (index) {
                return infoItem(s,
                    item: settingItems[index + 2], islast: index == 3);
              }),
            ),
            decoration: BoxDecoration(
              color: white,
              border: Border(
                top: BorderSide(color: iconGrey, width: hh(0.5)),
                bottom: BorderSide(color: iconGrey, width: hh(0.5)),
              ),
            ),
          ),
          SizedBox(height: hh(35)),
          Consumer<SettingStates>(
              builder: (BuildContext context, state, child) {
            return Container(
              width: s.width,
              height: hh(95),
              child: Column(
                children: List.generate(2, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 1) {
                        state.changeOpenSheets();
                      }
                    },
                    child: infoItem(s,
                        item: settingItems[index + 6], islast: index == 1),
                  );
                }),
              ),
              decoration: BoxDecoration(
                color: white,
                border: Border(
                  top: BorderSide(color: iconGrey, width: hh(0.5)),
                  bottom: BorderSide(color: iconGrey, width: hh(0.5)),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

List<InfoItemModel> settingItems = [
  InfoItemModel(orangeAccent, "star", "Starred Messages", ""),
  InfoItemModel(greenAccent, "desktop", "Whatsapp Web/desktop", ""),
  InfoItemModel(accentColor, "key", "Account", ""),
  InfoItemModel(darkGreen, "whatsapp", "Chats", ""),
  InfoItemModel(red, "notification", "Notifications", ""),
  InfoItemModel(darkGreen, "data_storage", "Data and Storage Usage", ""),
  InfoItemModel(blueGray, "i", "Help", ""),
  InfoItemModel(redAccent, "heart_border", "Tell a Friend", ""),
];
