import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/res/index.dart';

class Calls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
        width: s.width,
        height: s.height,
        color: grayBg,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Consumer<CallStates>(
            builder: (BuildContext context, CallStates state, Widget child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: hh(88)),
                  ...List.generate(
                    12,
                    (index) => allCallItem(s, callState: state),
                  ),
                  SizedBox(height: hh(83)),
                ],
              );
            },
          ),
        ));
  }
}

Widget allCallItem(Size s, {CallStates callState}) => Container(
      width: s.width,
      height: hh(56),
      color: white,
      child: Row(
        children: [
          Container(
            height: hh(56),
            padding: EdgeInsets.only(left: ww(16)),
            margin: EdgeInsets.only(right: ww(8)),
            child: Row(
              children: [
                callState.isEditing
                    ? Container(
                        width: ww(20),
                        height: ww(20),
                        margin: EdgeInsets.only(right: ww(8)),
                        child: Center(
                          child: Icon(Icons.remove, color: white),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primary,
                        ),
                      )
                    : Container(),
                Container(
                  width: ww(40),
                  height: ww(40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/u0.png")),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Martin Randolph",
                        style:
                            reg16(color: callState.page == 1 ? primary : black),
                      ),
                      SizedBox(height: hh(2)),
                      Row(
                        children: [
                          svgImage(
                            img: "assets/icons/phone_alt.svg",
                            color: textGrey,
                            height: hh(14.5),
                          ),
                          SizedBox(width: ww(8)),
                          Text(
                            "outgoing",
                            style: reg14(color: textGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: ww(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10/13/20",
                          style: reg14(color: textGrey),
                        ),
                        callState.isEditing
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(left: ww(10)),
                                child: svgImage(
                                  img: "assets/icons/info.svg",
                                  width: ww(20),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: iconGrey,
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget callsAppbar(BuildContext context, Size s, {CallStates callState}) =>
    Container(
      width: s.width,
      height: hh(88),
      color: barGrey,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              callState.changeEditStatus();
            },
            child: Container(
              width: ww(343 - 167.0) / 2,
              child: paddingLeft(
                child: Text(
                  "Edit",
                  style: reg17(color: accentColor),
                ),
              ),
            ),
          ),
          Container(
            width: ww(151),
            height: hh(28),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    callState.changePage(0);
                  },
                  child: Container(
                    width: ww(149) / 2,
                    height: hh(28),
                    child: Center(
                      child: Text(
                        "All",
                        style: med13(
                            color: callState.page == 0 ? white : accentColor),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: callState.page == 0 ? accentColor : white,
                      border: Border.all(color: accentColor, width: 1),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(hh(8)),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    callState.changePage(1);
                  },
                  child: Container(
                    width: ww(149) / 2,
                    height: hh(28),
                    child: Center(
                      child: Text(
                        "Missed",
                        style: med13(
                            color: callState.page == 0 ? accentColor : white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: callState.page == 0 ? white : accentColor,
                      border: Border.all(color: accentColor, width: 1),
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(hh(8)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ww(343 - 167.0) / 2,
            padding: EdgeInsets.only(right: ww(13)),
            alignment: Alignment.centerRight,
            child: callState.isEditing
                ? Text(
                    "Clear",
                    style: reg17(color: accentColor),
                  )
                : svgImage(
                    img: "assets/icons/add_call.svg",
                    color: accentColor,
                    width: hh(24),
                  ),
          ),
        ],
      ),
    );
