import 'package:bitcoin_ticker_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  CustomButton({required this.label});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(k10radius),
      ),
      child: Padding(
        padding: kCardInsideEdgePadding,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: kCardTextStyle,
        ),
      ),
    );
  }
}
