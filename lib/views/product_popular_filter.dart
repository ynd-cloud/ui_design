

import 'package:flutter/material.dart';
import 'package:ui_design/models/product_popular.dart';

class ProductPopularFilterPage extends StatefulWidget {
  final ProductFilter productFilter;

  ProductPopularFilterPage({Key key, this.productFilter}) : super(key: key);

  @override
  _ProductPopularFilterPageState createState() =>
      _ProductPopularFilterPageState();
}

class _ProductPopularFilterPageState extends State<ProductPopularFilterPage> {
  ProductFilter filter;

  @override
  void initState() {
    super.initState();
    filter = widget.productFilter;
  }

  @override
  Widget build(BuildContext context) {
    List<String> allBrandList = filter.allBrands.toList()..sort();
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.check),
                tooltip: 'OK',
                onPressed: () {
                  Navigator.pop(context, filter);
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
                title: Text('Brands'),
                trailing: allBrandList.length == filter.selectedBrands.length
                    ? FlatButton(
                        child: Text('Unselect All'),
                        onPressed: () {
                          filter.selectedBrands.clear();
                        },
                      )
                    : FlatButton(
                        child: Text('Select All'),
                        onPressed: () {
                          allBrandList
                              .forEach((b) => filter.selectedBrands.add(b));
                        },
                      )),
            Wrap(
              children: allBrandList.map((b) => filterChipMaker(b)).toList(),
            ),
          ],
        ));
  }

  Widget filterChipMaker(String b) {
    return FilterChip(
      avatar: Text(' '),
      label: Text(b),
      selected: filter.selectedBrands.contains(b),
      onSelected: (bool sel) {
        setState(() {
          if (sel)
            filter.selectedBrands.add(b);
          else
            filter.selectedBrands.remove(b);
        });
      },
    );
  }
}
