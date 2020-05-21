import 'package:flutter/material.dart';

class ProductDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('ยืนยันเพื่อลบสินค้านี้'),
      actions: <Widget>[
        FlatButton(
          child: Text('ยืนยัน'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('ยกเลิก'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        )
      ],
      
    );
  }
}