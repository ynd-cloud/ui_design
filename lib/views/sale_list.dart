import 'package:flutter/material.dart';

class SaleListPage extends StatefulWidget {
  @override
  _SaleListPageState createState() => _SaleListPageState();
}

class _SaleListPageState extends State<SaleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('รายการขาย'),
          backgroundColor: Color(0xFFFD7384),
          elevation: 0.0,
          //iconTheme: new IconThemeData(color: Color(0XFFFC7B4D))
          ),
    );
  }
}