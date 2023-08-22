import 'package:flutter/material.dart';

class custom_button extends StatelessWidget {
   custom_button({this.onTap ,required this.text});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
        ),
        width: double.infinity,
        height:50 ,
        child: Center(child: Text(text)),
      ),
    );
  }
}
