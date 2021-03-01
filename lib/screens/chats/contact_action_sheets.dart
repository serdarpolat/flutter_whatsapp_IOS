import 'package:flutter/material.dart';
import 'package:whatsapp_ui/res/index.dart';

class ContactActionSheets extends StatelessWidget {
  final ChatStates state;

  const ContactActionSheets({Key key, this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 240),
      width: s.width,
      height: s.height,
      color: state.openChatMore ? black.withOpacity(0.4) : Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(titles.length, (index) {
          return GestureDetector(
            onTap: () {
              if (index == 5) {
                state.changeOpenChatMore();
              }
            },
            child: Container(
              width: ww(355),
              height: hh(57),
              margin: EdgeInsets.only(
                  bottom: index == 5
                      ? hh(28)
                      : index == 4
                          ? hh(8)
                          : 0),
              child: Center(
                child: Text(
                  titles[index],
                  style: index == 5
                      ? semi19(color: accentColor)
                      : reg20(color: index == 4 ? primary : accentColor),
                ),
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: index == 5
                    ? BorderRadius.circular(hh(15))
                    : index == 0
                        ? BorderRadius.vertical(top: Radius.circular(hh(15)))
                        : index == 4
                            ? BorderRadius.vertical(
                                bottom: Radius.circular(hh(15)))
                            : BorderRadius.circular(0.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}

List<String> titles = [
  "Mute",
  "Contact Info",
  "Export Chat",
  "Clear Chat",
  "Delete Chat",
  "Cancel",
];

// Widget actionButton({String title, bool}) => ;
