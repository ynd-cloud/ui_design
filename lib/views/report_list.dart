import 'package:flutter/material.dart';

class ReportListPage extends StatefulWidget {
  @override
  _ReportListPageState createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('รายงาน'),
          backgroundColor: Color(0XFFF1B069),
          elevation: 0.0,
          //iconTheme: new IconThemeData(color: Color(0XFF2BD093))
          ),
    );
  }
}