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
      body: Consumer<PageStates>(
        builder: (BuildContext context, state, Widget child) {
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
                  top: state.openChatDetail ? 0 : s.height,
                  left: 0,
                  child: ChatDetail(),
                ),
                state.openChatDetail
                    ? writeMessageActions(s)
                    : bottomBar(
                        s,
                        state: state,
                        pageCtrl: controller,
                      ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 240),
                  top: state.openContactInfo ? 0 : s.height,
                  // top: 0,
                  left: 0,
                  child: ContactInfo(),
                ),
                state.openEditChats
                    ? EditChats()
                    : appBar(
                        context,
                        state: state,
                        openEditContact: () {
                          pushToPage(context, EditContact());
                        },
                        onTap: () {
                          state.changeOpenEditChats();
                          print("object");
                        },
                      ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 240),
                  top: state.openChatMore ? 0 : s.height,
                  left: 0,
                  child: ActionSheets(
                    state: state,
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
