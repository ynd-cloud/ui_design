import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_store/flutter_cache_store.dart';

import 'package:ui_design/models/product_popular.dart';

class ProductPopularPage extends StatefulWidget {
  @override
  _ProductPopularPageState createState() => _ProductPopularPageState();
}

class _ProductPopularPageState extends State<ProductPopularPage> {
  List<ProductPopular> products = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final store = await CacheStore.getInstance();
    File file = await store.getFile('https://www.advice.co.th/pc/get_comp/vga');
    final jsonString = json.decode(file.readAsStringSync());

    setState(() {
      jsonString.forEach((v) {
        final product = ProductPopular.fromJson(v);
        if (product.advId != '') products.add(product);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Product Popular"),
        //backgroundColor: Colors.transparent,
        //elevation: 0.0,
        //iconTheme: new IconThemeData(color: Color(0xFF18D191)),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            child: Row(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: CachedNetworkImage(
                    imageUrl: "https://www.advice.co.th/pic-pc/vga/${products[i].vgaPicture}",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text('${products[i].vgaBrand}'),
                    Text('${products[i].vgaModel}'),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
