import 'package:flutter/cupertino.dart';

class PageStates extends ChangeNotifier {
  int _page = 3;
  int get page => _page;

  changePage(int page) {
    _page = page;
    notifyListeners();
  }
}

class ChatStates extends ChangeNotifier {
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

  bool _openContactInfo = false;
  bool get openContactInfo => _openContactInfo;

  changeOpenContactInfo() {
    _openContactInfo = !_openContactInfo;
    notifyListeners();
  }
}

class CallStates extends ChangeNotifier {
  int _page = 0;

  int get page => _page;

  changePage(int p) {
    _page = p;
    notifyListeners();
  }

  bool _isEditing = false;
  bool get isEditing => _isEditing;

  changeEditStatus() {
    _isEditing = !_isEditing;
    notifyListeners();
  }
}
