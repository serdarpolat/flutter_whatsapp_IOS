class ChatListItemModel {
  String img;
  String name;
  String date;
  String message;
  String icon;
  int idx;

  ChatListItemModel(
      this.img, this.name, this.date, this.message, this.icon, this.idx);
}

List<ChatListItemModel> chatData = [
  ChatListItemModel("assets/images/u0.png", "Martin Randolph", "11/16/20",
      "Yes, 2pm is awesome", "read", 0),
  ChatListItemModel("assets/images/u1.png", "Andrew Parker", "11/16/20",
      "What kind of strategy is better?", "read", 1),
  ChatListItemModel("assets/images/u2.png", "Karen Castillo", "11/16/20",
      "What kind of strategy is better?", "voice", 2),
  ChatListItemModel("assets/images/u3.png", "Maximillian Jacobson", "10/30/20",
      "Bro, I have good idea", "read", 3),
  ChatListItemModel("assets/images/u4.png", "Marta Craig", "10/28/20",
      "Bro, I have good idea", "camera_alt", 4),
  ChatListItemModel(
      "assets/images/u5.png",
      "Tabitha Peter",
      "8/25/20",
      "Actually, I wanted to check with you\nabout your online bussiness plan on our",
      null,
      5),
  ChatListItemModel("assets/images/u6.png", "Maisy Humphrey", "11/16/20",
      "Welcome, to make design process", "read", 6),
  ChatListItemModel("assets/images/u7.png", "Kieron Dotson", "11/16/20",
      "Ok, have a good trip!", "read", 7),
];
