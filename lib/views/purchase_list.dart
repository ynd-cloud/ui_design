import 'package:flutter/material.dart';

class PurchaseListPage extends StatefulWidget {
  @override
  _PurchaseListPageState createState() => _PurchaseListPageState();
}

class _PurchaseListPageState extends State<PurchaseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('รายการสั่งซื้อสินค้า'),
          backgroundColor: Color(0XFF2BD093),
          elevation: 0.0,
          //iconTheme: new IconThemeData(color: Color(0XFF2BD093))
          ),
    );
  }
}
