import 'dart:ffi';
import 'dart:async';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class HomePage  extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState() ;
}

class _HomePageState extends State<HomePage> {

  late List currencies;

  @override
  Future<void> initState() async {
    super.initState();
    //call the function to get currencies
    //currencies = await getCurrencies();
    List currencies = await getCurrencies();
  // Before printing it to the Console
     print(currencies);
  }

  Future<List> getCurrencies() async {
  String apiUrl = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
  // Make a HTTP GET request to the CoinMarketCap API.
  // Await basically pauses execution until the get() function returns a Response
  http.Response response = await http.get(Uri.parse(apiUrl));
  // Using the JSON class to decode the JSON String
  return json.decode(response.body);
}

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(title: Text("Crypto App"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      // child: Flexible(
      //   child: ListView.builder(
      //     itemCount: 0,
      //     itemBuilder: (BuildContext context, int index){},
      //   ),
      // ),
    );
  }
}
