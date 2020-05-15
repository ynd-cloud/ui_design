import 'package:flutter/material.dart';

class StoreListPage extends StatefulWidget {
  @override
  _StoreListPageState createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
          title: Text('คลังสินค้า'),
          backgroundColor: Color(0XFF53CEDB),
          elevation: 0.0,
          //iconTheme: new IconThemeData(color: Color(0XFF2BD093))
          ),
    );
  }
}