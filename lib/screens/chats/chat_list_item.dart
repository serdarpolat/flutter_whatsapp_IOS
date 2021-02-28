import 'dart:ui';

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/res/index.dart';

double posMin = 0;

class ChatListItem extends StatefulWidget {
  final ChatListItemModel item;

  const ChatListItem({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _ChatListItemState createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  double get posListItem => lerp(posMin, -ww(148.0));
  double get posMore => lerp(posMin, ww(72));
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Consumer<ChatStates>(
      builder: (BuildContext context, state, Widget child) {
        return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: s.width,
                height: hh(74),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: hh(74),
                        height: hh(74),
                        color: blueGray,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Icon(
                              Icons.archive_rounded,
                              color: white,
                              size: ww(25),
                            ),
                            SizedBox(height: hh(2)),
                            Text(
                              "Archive",
                              style: reg14(color: white),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: posMore,
                      child: GestureDetector(
                        onTap: () {
                          state.changeOpenChatMore();
                        },
                        child: Container(
                          width: hh(74),
                          height: hh(74),
                          color: iconGrey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Icon(
                                Icons.more_horiz,
                                color: white,
                                size: ww(25),
                              ),
                              Spacer(),
                              Text(
                                "More",
                                style: reg14(color: white),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: posListItem,
                      child: GestureDetector(
                        onTap: () {
                          if (!state.openEditChats)
                            state.changeOpenChatDetail();
                        },
                        onHorizontalDragUpdate: (DragUpdateDetails details) {
                          _controller.value -=
                              details.primaryDelta / (s.width - ww(74));
                        },
                        onHorizontalDragEnd: (DragEndDetails details) {
                          if (_controller.isAnimating ||
                              _controller.status == AnimationStatus.completed)
                            return;

                          final double flingVelocity =
                              -details.velocity.pixelsPerSecond.dx / -ww(174);
                          if (flingVelocity < 0.0)
                            _controller.fling(
                                velocity: math.max(2.0, -flingVelocity));
                          else if (flingVelocity > 0.0)
                            _controller.fling(
                                velocity: math.min(-2.0, -flingVelocity));
                          else
                            _controller.fling(
                                velocity: _controller.value < 0.5 ? -2.0 : 2.0);
                        },
                        child: Container(
                          width: s.width,
                          height: hh(74),
                          color: white,
                          child: Row(
                            children: [
                              SizedBox(width: ww(16)),
                              state.openEditChats
                                  ? Row(
                                      children: [
                                        Container(
                                          width: ww(20),
                                          height: ww(20),
                                          decoration: BoxDecoration(
                                            color: white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: iconGrey,
                                              width: 1.5,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: ww(6))
                                      ],
                                    )
                                  : Container(),
                              chatImage(img: widget.item.img),
                              SizedBox(width: ww(16)),
                              chatDetail(
                                s,
                                name: widget.item.name,
                                date: widget.item.date,
                                icon: widget.item.icon,
                                message: widget.item.message,
                                state: state,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}

Widget chatImage({String img}) => Container(
      width: ww(52),
      height: ww(52),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );

Widget chatDetail(Size s,
        {String name,
        String date,
        String icon,
        String message,
        Color iconColor,
        ChatStates state}) =>
    Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: iconGrey,
              width: 0.33,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: ww(260),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: semi16(color: black),
                      ),
                      Text(
                        date,
                        style: reg14(color: textGrey),
                      ),
                    ],
                  ),
                  SizedBox(height: hh(6)),
                  Row(
                    children: [
                      icon == null
                          ? Container()
                          : svgImage(
                              img: "assets/icons/$icon.svg",
                              width: icon == 'read'
                                  ? ww(17)
                                  : icon == 'voice'
                                      ? ww(9)
                                      : ww(14),
                              height: icon == 'read'
                                  ? hh(11)
                                  : icon == 'voice'
                                      ? hh(15)
                                      : hh(11),
                              label: icon == 'read'
                                  ? 'Message Readed'
                                  : icon == 'voice'
                                      ? 'Voice Message'
                                      : 'Image Message',
                              color: icon == 'read'
                                  ? accentColor
                                  : icon == 'voice'
                                      ? green
                                      : textGrey,
                            ),
                      SizedBox(width: ww(2.36)),
                      Container(
                        child: Text(
                          icon == 'read' || icon == null
                              ? message
                              : icon == 'voice'
                                  ? '0:14'
                                  : 'Photo',
                          style: reg14(color: textGrey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            state.openEditChats
                ? Container()
                : Row(
                    children: [
                      SizedBox(width: ww(6)),
                      Container(
                        child: Center(
                          child: svgImage(
                            img: "assets/icons/forward.svg",
                            width: ww(7),
                            height: hh(12),
                            label: "Next Icon",
                            color: iconGrey,
                          ),
                        ),
                      ),
                      SizedBox(width: ww(10)),
                    ],
                  ),
          ],
        ),
      ),
    );
