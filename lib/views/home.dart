import 'package:flutter/material.dart';
import 'package:ui_design/views/product_list.dart';
import 'package:ui_design/views/product_popular_list.dart';
import 'package:ui_design/views/purchase_list.dart';
import 'package:ui_design/views/receive_list.dart';
import 'package:ui_design/views/report_list.dart';
import 'package:ui_design/views/sale_list.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0XFF29D091),
        currentIndex: _bottomNavIndex,
        onTap: (int index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        items: [
          new BottomNavigationBarItem(
              title: new Text('หน้าหลัก'), icon: new Icon(Icons.home)),
          new BottomNavigationBarItem(
              title: new Text('ประกาศ'), icon: new Icon(Icons.announcement)),
          new BottomNavigationBarItem(
              title: new Text('พูดคุย'), icon: new Icon(Icons.message)),
          new BottomNavigationBarItem(
              title: new Text('แจ้งเตือน'),
              icon: new Icon(Icons.notifications)),
        ],
      ),
      appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF18D191))),
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Container(
              child: new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Text(
                    "Explore",
                    style: new TextStyle(
                      fontSize: 30.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SaleListPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: new Container(
                        height: 100.0,
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Color(0xFFFD7384)),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.attach_money,
                              color: Colors.white,
                            ),
                            new Text("ขายสินค้า",
                                style: new TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  )),
                  new Expanded(
                      child: new Container(
                    height: 100.0,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PurchaseListPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 2.5, right: 2.5),
                              child: new Container(
                                decoration: new BoxDecoration(
                                    color: Color(0XFF2BD093),
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: new Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                    ),
                                    new Text('จัดซื้อ',
                                        style:
                                            new TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReceivePistPage()));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 2.5, right: 2.5),
                              child: new Container(
                                decoration: new BoxDecoration(
                                    color: Color(0XFFFC7B4D),
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: new Icon(
                                        Icons.receipt,
                                        color: Colors.white,
                                      ),
                                    ),
                                    new Text('รับสินค้า',
                                        style:
                                            new TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  new Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductListPage()));
                    },
                    child: new Container(
                      height: 100.0,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 2.5, bottom: 2.5),
                              child: new Container(
                                decoration: new BoxDecoration(
                                    color: Color(0XFF53CEDB),
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: new Icon(
                                        Icons.store,
                                        color: Colors.white,
                                      ),
                                    ),
                                    new Text('คลังสินค้า',
                                        style:
                                            new TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ReportListPage()));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.5, top: 2.5),
                                child: new Container(
                                  decoration: new BoxDecoration(
                                      color: Color(0XFFF1B069),
                                      borderRadius:
                                          new BorderRadius.circular(5.0)),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: new Icon(
                                          Icons.show_chart,
                                          color: Colors.white,
                                        ),
                                      ),
                                      new Text('รายงาน',
                                          style: new TextStyle(
                                              color: Colors.white))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              new SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text("สินค้ายอดนิยม",
                          style: new TextStyle(fontSize: 18.0))),
                  new Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductPopularPage()));
                    },
                    child: new Text(
                      "View All",
                      style: new TextStyle(color: Color(0XFF2BD093)),
                      textAlign: TextAlign.end,
                    ),
                  ))
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height: 150.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://www.howtogeek.com/wp-content/uploads/2016/01/steam-and-xbox-controllers.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          new Text(
                            "Play Station",
                            style: new TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    width: 5.0,
                  ),
                  new Expanded(
                    child: Container(
                      height: 150.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://pawanjewellers.in/wp-content/uploads/2016/09/Jewellery-new.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          new Text("Jewellery and Watches ",
                              style: new TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    width: 5.0,
                  ),
                  new Expanded(
                    child: Container(
                      height: 150.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'http://images4.fanpop.com/image/photos/21600000/Electronics-hd-wallpaper-21627626-1920-1200.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          new Text('Electronics',
                              style: new TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              new SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text("สินค้าแนะนำ/โปรโมชั่น",
                          style: new TextStyle(fontSize: 18.0))),
                  new Expanded(
                      child: new Text(
                    "View All",
                    style: new TextStyle(color: Color(0XFF2BD093)),
                    textAlign: TextAlign.end,
                  ))
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height: 150.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://s1.cdn.autoevolution.com/images/gallery/LEXUS-HS-250h-3892_26.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          new Text(
                            "Motors",
                            style: new TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    width: 5.0,
                  ),
                  new Expanded(
                    child: Container(
                      height: 150.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://d3tvpxjako9ywy.cloudfront.net/blog/content/uploads/2015/03/company-culture-why-it-matters.jpg?av=6219bb831e993c907ca622baef062556'),
                                    fit: BoxFit.cover)),
                          ),
                          new Text("Jobs",
                              style: new TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    width: 5.0,
                  ),
                  new Expanded(
                    child: Container(
                      height: 150.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'http://images4.fanpop.com/image/photos/21600000/Electronics-hd-wallpaper-21627626-1920-1200.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          new Text('Electronics',
                              style: new TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              new SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: new Text("ลดล้างสต๊อค",
                          style: new TextStyle(fontSize: 18.0))),
                  new Expanded(
                      child: new Text(
                    "View All",
                    style: new TextStyle(color: Color(0XFF2BD093)),
                    textAlign: TextAlign.end,
                  ))
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height: 150.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://www.howtogeek.com/wp-content/uploads/2016/01/steam-and-xbox-controllers.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          new Text(
                            "Play Station",
                            style: new TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    width: 5.0,
                  ),
                  new Expanded(
                    child: Container(
                      height: 150.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'https://pawanjewellers.in/wp-content/uploads/2016/09/Jewellery-new.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          new Text("Jewellery and Watches ",
                              style: new TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  new SizedBox(
                    width: 5.0,
                  ),
                  new Expanded(
                    child: Container(
                      height: 150.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'http://images4.fanpop.com/image/photos/21600000/Electronics-hd-wallpaper-21627626-1920-1200.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          new Text('Electronics',
                              style: new TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
        )
      ],
    );
  }
}
