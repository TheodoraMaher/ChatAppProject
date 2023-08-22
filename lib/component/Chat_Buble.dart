import 'package:chat_project/models/messages.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class Chat_Bubble extends StatelessWidget {
  const Chat_Bubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 30, bottom: 30,right: 30),
        margin: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: KPrimarycolor,

        ) ,
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),),
      ),
    );
  }
}





class Chat_Bubble_ForFriend extends StatelessWidget {
  const Chat_Bubble_ForFriend({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 30, bottom: 30,right: 30),
        margin: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color(0xff006D84),

        ) ,
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),),
      ),
    );
  }
}
