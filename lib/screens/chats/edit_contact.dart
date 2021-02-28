import 'package:flutter/material.dart';
import 'package:whatsapp_ui/res/index.dart';

class EditContact extends StatefulWidget {
  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  Size get s => MediaQuery.of(context).size;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController surnameCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();

  @override
  void initState() {
    nameCtrl.text = "Martha";
    surnameCtrl.text = "Craig";
    countryCtrl.text = "New Zealand";
    mobileCtrl.text = "+1 202 555 0181";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        width: s.width,
        height: s.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: s.width,
              height: hh(88),
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: ww(16)),
                      child: Text(
                        "Cancel",
                        style: reg17(color: accentColor),
                      ),
                    ),
                  ),
                  Text(
                    "Edit Contact",
                    style: semi17(color: black),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: ww(16)),
                    child: Text(
                      "Save",
                      style: reg17(color: textGrey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: hh(35)),
            Container(
              width: s.width,
              height: hh(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: hh(50),
                    alignment: Alignment.centerLeft,
                    child: paddingLeft(
                      child: Text(
                        "Name",
                        style: semi16(color: black),
                      ),
                    ),
                  ),
                  SizedBox(width: ww(16)),
                  Column(
                    children: [
                      Container(
                        width: ww(263),
                        height: hh(50),
                        padding: EdgeInsets.symmetric(vertical: hh(8)),
                        child: TextField(
                          controller: nameCtrl,
                          style: reg16(color: black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
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
                      Container(
                        width: ww(263),
                        height: hh(50),
                        padding: EdgeInsets.symmetric(vertical: hh(8)),
                        child: TextField(
                          controller: surnameCtrl,
                          style: reg16(color: black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
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
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: s.width,
              height: hh(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: hh(50),
                    alignment: Alignment.centerLeft,
                    child: paddingLeft(
                      child: Text(
                        "Phone",
                        style: semi16(color: black),
                      ),
                    ),
                  ),
                  SizedBox(width: ww(16)),
                  Container(
                    width: ww(263),
                    height: hh(50),
                    padding: EdgeInsets.symmetric(vertical: hh(8)),
                    child: Row(
                      children: [
                        Text(
                          "New Zealand",
                          style: reg16(color: black),
                        ),
                        Spacer(),
                        svgImage(
                          img: "assets/icons/forward.svg",
                          color: iconGrey,
                          height: hh(14),
                        ),
                        SizedBox(width: ww(16)),
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
                ],
              ),
            ),
            Container(
              width: s.width,
              height: hh(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: hh(50),
                    alignment: Alignment.centerLeft,
                    child: paddingLeft(
                      child: Text(
                        "mobile",
                        style: reg16(color: accentColor),
                      ),
                    ),
                  ),
                  SizedBox(width: ww(16)),
                  Container(
                    width: ww(263),
                    height: hh(50),
                    padding: EdgeInsets.symmetric(vertical: hh(8)),
                    child: Row(
                      children: [
                        Text(
                          "+1 202 555 0181",
                          style: reg16(color: black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: textGrey,
              height: 0.5,
            ),
            SizedBox(height: hh(14)),
            paddingLeft(
              child: Text(
                "more fields",
                style: reg16(color: accentColor),
              ),
            ),
            SizedBox(height: hh(14)),
            paddingLeft(
              child: Text(
                "Delete Contact",
                style: reg16(color: primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
