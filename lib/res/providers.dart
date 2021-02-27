import 'package:flutter/cupertino.dart';

class PageStates extends ChangeNotifier {
  int _page = 3;
  int get page => _page;

  changePage(int page) {
    _page = page;
    notifyListeners();
  }

  bool _openEditChats = false;
  bool get openEditChats => _openEditChats;

  changeOpenEditChats() {
    _openEditChats = !_openEditChats;
    notifyListeners();
  }

  bool _openChatDetail = false;
  bool get openChatDetail => _openChatDetail;

  changeOpenChatDetail() {
    _openChatDetail = !_openChatDetail;
    notifyListeners();
  }

  bool _openChatMore = false;
  bool get openChatMore => _openChatMore;

  changeOpenChatMore() {
    _openChatMore = !_openChatMore;
    notifyListeners();
  }
}
