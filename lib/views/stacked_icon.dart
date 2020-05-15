import 'package:flutter/material.dart';

class StackedIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 50, top: 50),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0XFFFC6A7F)),
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0XFF18D191)),
          child: Icon(
            Icons.local_offer,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 40, top: 50),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0XFFFFCE56)),
          child: Icon(
            Icons.local_car_wash,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 90, top: 40),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0XFF45E0EC)),
          child: Icon(
            Icons.place,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
