import 'package:flutter/material.dart';
import 'package:whatsapp_ui/res/index.dart';

class SettingsActionSheets extends StatelessWidget {
  final SettingStates state;

  const SettingsActionSheets({Key key, this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 240),
      width: s.width,
      height: s.height,
      color: state.openSheets ? black.withOpacity(0.4) : Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(settings.length, (index) {
          return GestureDetector(
            onTap: () {
              if (index == 3) {
                state.changeOpenSheets();
              }
            },
            child: Container(
              width: ww(355),
              height: hh(57),
              margin: EdgeInsets.only(
                  bottom: index == 3
                      ? hh(28)
                      : index == 2
                          ? hh(8)
                          : 0),
              child: Center(
                child: Text(
                  settings[index],
                  style: index == 3
                      ? semi19(color: accentColor)
                      : reg20(color: accentColor),
                ),
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: index == 3
                    ? BorderRadius.circular(hh(15))
                    : index == 0
                        ? BorderRadius.vertical(top: Radius.circular(hh(15)))
                        : index == 2
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

List<String> settings = [
  "Mail",
  "Message",
  "More",
  "Cancel",
];

// Widget actionButton({String title, bool}) => ;
