import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/res/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Consumer4<PageStates, ChatStates, CallStates, SettingStates>(
        builder: (BuildContext context,
            PageStates pageState,
            ChatStates chatState,
            CallStates callState,
            SettingStates settingStates,
            Widget child) {
          return Container(
            width: s.width,
            height: s.height,
            child: Stack(
              children: [
                PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: pages,
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 120),
                  top: chatState.openChatDetail ? 0 : s.height,
                  left: 0,
                  child: ChatDetail(),
                ),
                chatState.openChatDetail
                    ? writeMessageActions(s)
                    : bottomBar(
                        s,
                        chatState: chatState,
                        pageState: pageState,
                        pageCtrl: controller,
                      ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 240),
                  top: chatState.openContactInfo ? 0 : s.height,
                  // top: 0,
                  left: 0,
                  child: ContactInfo(),
                ),
                chatState.openEditChats
                    ? EditChats()
                    : pageState.page == 0
                        ? statusAppbar(context, s)
                        : pageState.page == 1
                            ? callsAppbar(context, s, callState: callState)
                            : pageState.page == 3
                                ? appBar(
                                    context,
                                    state: chatState,
                                    openEditContact: () {
                                      pushToPage(context, EditContact());
                                    },
                                    onTap: () {
                                      chatState.changeOpenEditChats();
                                      print("object");
                                    },
                                  )
                                : Container(
                                    width: s.width,
                                    height: hh(88),
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).padding.top),
                                    color: barGrey,
                                    child: Center(
                                      child: Text("Settings",
                                          style: semi17(color: black)),
                                    ),
                                  ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 240),
                  top: chatState.openChatMore ? 0 : s.height,
                  left: 0,
                  child: ContactActionSheets(
                    state: chatState,
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 240),
                  top: settingStates.openSheets ? 0 : s.height,
                  left: 0,
                  child: SettingsActionSheets(
                    state: settingStates,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Widget> pages = [
  Status(),
  Calls(),
  Camera(),
  Chats(),
  Settings(),
];
