import 'package:flutter/material.dart';
import 'package:whatsapp_ui/res/index.dart';

class BottomItemModel {
  String icon;
  String iconAlt;
  String title;
  int idx;

  BottomItemModel({
    this.icon,
    this.iconAlt,
    this.title,
    this.idx,
  });
}

List<BottomItemModel> bottomItems = [
  BottomItemModel(
    icon: "status",
    iconAlt: "status_alt",
    title: "Status",
    idx: 0,
  ),
  BottomItemModel(
    icon: "phone",
    iconAlt: "phone_alt",
    title: "Calls",
    idx: 1,
  ),
  BottomItemModel(
    icon: "camera",
    iconAlt: "camera_alt",
    title: "Camera",
    idx: 2,
  ),
  BottomItemModel(
    icon: "chats",
    iconAlt: "chats_alt",
    title: "Chats",
    idx: 3,
  ),
  BottomItemModel(
    icon: "settings",
    iconAlt: "settings_alt",
    title: "Settings",
    idx: 4,
  ),
];

Widget bottomBar(Size s, {PageStates state, PageController pageCtrl}) => Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: s.width,
        height: hh(83),
        decoration: BoxDecoration(
          color: barGrey,
          boxShadow: [
            BoxShadow(
              color: barShadowGrey,
              offset: Offset(0, -0.33),
            ),
          ],
        ),
        padding: EdgeInsets.only(bottom: hh(13)),
        child: Container(
          child: state.openEditChats
              ? padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Archive",
                        style: reg17(color: textGrey),
                      ),
                      Text(
                        "Read All",
                        style: reg17(color: textGrey),
                      ),
                      Text(
                        "Delete",
                        style: reg17(color: textGrey),
                      ),
                    ],
                  ),
                )
              : Row(
                  children: List.generate(
                    bottomItems.length,
                    (index) {
                      var item = bottomItems[index];
                      return bottomButton(
                        s,
                        item: item,
                        isActive: item.idx == state.page,
                        ontap: () {
                          state.changePage(item.idx);
                          pageCtrl.animateToPage(
                            item.idx,
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 360),
                          );
                        },
                      );
                    },
                  ),
                ),
        ),
      ),
    );

Widget bottomButton(Size s,
        {BottomItemModel item, Function ontap, bool isActive}) =>
    GestureDetector(
      onTap: ontap,
      child: Container(
        width: s.width / 5,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            svgImage(
              img: isActive
                  ? "assets/icons/${item.iconAlt}.svg"
                  : "assets/icons/${item.icon}.svg",
              color: isActive ? accentColor : textGrey,
              height: ww(26),
            ),
            SizedBox(height: hh(5)),
            Text(
              item.title,
              style: med10(color: isActive ? accentColor : textGrey),
            )
          ],
        ),
      ),
    );
