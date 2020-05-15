import 'package:flutter/material.dart';

class ReceivePistPage extends StatefulWidget {
  @override
  _ReceivePistPageState createState() => _ReceivePistPageState();
}

class _ReceivePistPageState extends State<ReceivePistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('รายการรับสินค้า'),
          backgroundColor: Color(0XFFFC7B4D),
          elevation: 0.0,
          //iconTheme: new IconThemeData(color: Color(0XFFFC7B4D))
          ),
    );
  }
}
