import 'package:flutter/material.dart';

class ShopName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 60),
                child: Text("Small Shop", style: TextStyle(fontSize: 30)),
              )
            ],
    );
  }
}