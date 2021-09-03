import 'package:bitcoin_ticker_flutter/Custom/custom_scroller.dart';
import 'package:bitcoin_ticker_flutter/Custom/cutom_button.dart';
import 'package:bitcoin_ticker_flutter/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: addButtonsInColumn(),
          ),
          CustomScroller(child: null),
        ],
      ),
    );
  }

  List<Widget> addButtonsInColumn() {
    List<Widget> list = [];

    for (int i = 0; i < 3; i++) {
      list.add(Padding(
        padding: kCardEdgePadding,
        child: CustomButton(label: '1 BTC = ? USD'),
      ));
    }

    return list;
  }
}
