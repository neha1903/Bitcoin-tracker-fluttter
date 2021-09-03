import 'package:flutter/material.dart';

class CustomScroller extends StatelessWidget {
  final dynamic child;
  CustomScroller({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 30.0),
      color: Colors.lightBlue,
      child: child,
    );
  }
}
