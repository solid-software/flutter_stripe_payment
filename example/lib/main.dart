import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    print('init state');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: RaisedButton(
            child: Text("Add Card"),
            onPressed: () async {
              await StripeSource.setPublishableKey(
                  "pk_test_ZjlJkoiT7OYNdQstW8Sm5HK00090HGGjoF");
              print("Ready: ${StripeSource.ready}");
              StripeSource.addSource().then(_addSource);
            },
          ),
        ),
      ),
    );
  }

  void _addSource(String token) {
    print("Token => $token");
  }
}
