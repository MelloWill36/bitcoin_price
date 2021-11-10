import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _precoBuy = "0";
  String _USD = "0";
  String _EUR = "0";

  void _recuperarPreco() async {

    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode( response.body );
    setState(() {
      _precoBuy = retorno["BRL"]["buy"].toString();
      _USD = retorno["USD"]["buy"].toString();
      _EUR = retorno["EUR"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("imagens/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "DÓLAR",
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "\$ " + _USD,
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "EURO",
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "€ " + _EUR,
                  style: TextStyle(
                      fontSize: 35
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "REAL",
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Text(
                  "R\$ " + _precoBuy,
                  style: TextStyle(
                      fontSize: 35
                  ),
                ),
              ),
              RaisedButton(
                child: Text(
                    "Atualizar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
                color: Colors.orange,
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                onPressed: _recuperarPreco,
              )
            ],
          ),
        ),
      ),
    );
  }
}
