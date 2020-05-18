import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_store/flutter_cache_store.dart';

import 'package:ui_design/models/product_popular.dart';
import 'package:ui_design/views/product_popular_filter.dart';

class ProductPopularPage extends StatefulWidget {
  @override
  _ProductPopularPageState createState() => _ProductPopularPageState();
}

class _ProductPopularPageState extends State<ProductPopularPage> {
  List<ProductPopular> products = [];
  List<ProductPopular> allProduct = [];
  List<ProductPopular> filterProduct = [];
  String _sortBy = 'lastest';
  BuildContext _scaffoldContext;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ProductFilter productFilter = ProductFilter();

  @override
  void initState() {
    super.initState();
    loadData();
    filterAction();
  }

  loadData() async {
    final store = await CacheStore.getInstance();
    File file = await store.getFile('https://www.advice.co.th/pc/get_comp/vga');
    final jsonString = json.decode(file.readAsStringSync());

    setState(() {
      jsonString.forEach((v) {
        final product = ProductPopular.fromJson(v);
        if (product.advId != '' && product.vgaPriceAdv != 0)
          allProduct.add(product);
      });
    });
  }

  filterAction() {
    productFilter.allBrands = allProduct.map((v) => v.vgaBrand).toSet();
    productFilter.selectedBrands = allProduct.map((v) => v.vgaBrand).toSet();
    //productFilter.selectedBrands.remove('HIS');
    setState(() {
      filterProduct.clear();
      allProduct.forEach((v) {
        if (productFilter.selectedBrands.contains(v.vgaBrand)) filterProduct.add(v);
      });
    });
  }

  sortAction() {
    setState(() {
      if (_sortBy == 'lastest') {
        _sortBy = 'price';
        filterProduct.sort((a, b) {
          return a.vgaPriceAdv - b.vgaPriceAdv;
        });
      } else {
        _sortBy = 'lastest';
        filterProduct.sort((a, b) {
          return b.id - a.id;
        });
      }
    });
  }

  showMessage(String txt) {
    Scaffold.of(_scaffoldContext).showSnackBar(SnackBar(
      content: Text(txt),
      duration: Duration(milliseconds: 500),
    ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Product Popular"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                tooltip: 'temp filter acion',
                onPressed: () {
                  filterAction();
                }),
            IconButton(
                icon: Icon(Icons.tune),
                tooltip: 'filtering',
                onPressed: () {
                  navigate2filterpage(context);
                }),
            IconButton(
                icon: Icon(Icons.sort),
                tooltip: 'sorting',
                onPressed: () {
                  sortAction();
                  showMessage(_sortBy);
                }),
          ],
        ),
        body: Builder(builder: (context) {
          _scaffoldContext = context;
          return bodyBuilder();
        }));
  }

  navigate2filterpage(BuildContext context) async {
    //productFilter.productBrands = ['ASUS'];
    ProductFilter result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductPopularFilterPage(
                  productFilter: productFilter,
                )));
    if(result!=null){
      setState(() {
        productFilter.selectedBrands = result.selectedBrands;
      });
      filterAction();
    }
  }

  Widget bodyBuilder() {
    return ListView.builder(
      itemCount: filterProduct.length,
      itemBuilder: (context, i) {
        var v = filterProduct[i];
        return Card(
          elevation: 0,
          child: Container(
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://www.advice.co.th/pic-pc/vga/${v.vgaPicture}",
                      //placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${v.vgaBrand}'),
                          Text('${v.vgaModel}'),
                          Text('${v.vgaPriceAdv} บาท'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
