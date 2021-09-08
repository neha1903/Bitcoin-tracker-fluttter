import 'dart:io' show Platform;

import 'package:bitcoin_ticker_flutter/customWidgets/custom_button.dart';
import 'package:bitcoin_ticker_flutter/customWidgets/custom_scroller.dart';
import 'package:bitcoin_ticker_flutter/data/coin_data.dart';
import 'package:bitcoin_ticker_flutter/services/exchange_rates.dart';
import 'package:bitcoin_ticker_flutter/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  ExchangeCurrency exchangeCurrency = ExchangeCurrency();
  String selectedCurrency = "AUD";
  int currency = 0;
  var data = [];

  @override
  void initState() {
    super.initState();
    setUI();
  }

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
            children: addButtonsInColumn(data),
          ),
          CustomScroller(
            child: Platform.isIOS ? iosPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }

  Widget androidDropDown() {
    List<DropdownMenuItem<String>> list = [];
    var currenciesList = coinData.currenciesList;
    for (String currency in currenciesList) {
      list.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: list,
      onChanged: (value) {
        setState(() async {
          selectedCurrency = value.toString();
          data = await exchangeCurrency.getAllCurrencyData(selectedCurrency);
          setState(() {
            addButtonsInColumn(data);
          });
        });
      },
    );
  }

  Widget iosPicker() {
    List<Widget> list = [];
    var currenciesList = coinData.currenciesList;
    for (String currency in currenciesList) {
      list.add(
        Text(
          currency,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async {
        print(selectedIndex);
        selectedCurrency = currenciesList[selectedIndex];
        data = await exchangeCurrency.getAllCurrencyData(selectedCurrency);
        setState(() {
          addButtonsInColumn(data);
        });
      },
      children: list,
    );
  }

  List<Widget> addButtonsInColumn(var data) {
    List<Widget> list = [];

    for (int i = 0; i < data.length; i++) {
      list.add(Padding(
        padding: kCardEdgePadding,
        child: CustomButton(
            label:
                "1 ${coinData.cryptoList[i]} = ${data[i].toString()} $selectedCurrency"),
      ));
    }

    return list;
  }

  void setUI() async {
    data = await exchangeCurrency.getAllCurrencyData(selectedCurrency);
    setState(() {
      addButtonsInColumn(data);
    });
  }
}
