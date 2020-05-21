import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_design/models/product.dart';
import 'package:ui_design/models/product_update.dart';
import 'package:ui_design/services/product_service.dart';

class ProductModify extends StatefulWidget {
 
  final int rowID;
  ProductModify({this.rowID});

  @override
  _ProductModifyState createState() => _ProductModifyState();
}

class _ProductModifyState extends State<ProductModify> {
  bool get isEditing => widget.rowID != null;

  ProductService get productsService => GetIt.I<ProductService>();

  String errorMessage;
  Product product;

  TextEditingController _codeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      productsService.getProduct(widget.rowID)
        .then((response) {
          setState(() {
            _isLoading = false;
          });

          if (response.error) {
            errorMessage = response.errorMessage ?? 'An error occurred';
          }
          product = response.data;
          _codeController.text = product.code;
          _nameController.text = product.name;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'แก้ไขข้อมูลสินค้า' : 'เพิ่มข้อมูลสินค้า')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
          children: <Widget>[
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                hintText: 'Barcode สินค้า'
              ),
            ),

            Container(height: 8),

            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'ชื่อสินค้า'
              ),
            ),

            Container(height: 16),

            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text('ตกลง', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  if (isEditing) {
                    //Update on API
                    setState(() {
                      _isLoading = true;
                    });
                    final product = ProductManipulation(
                      code: _codeController.text,
                      name: _nameController.text
                    );
                    final result = await productsService.updateProduct(widget.rowID, product);
                    
                    setState(() {
                      _isLoading = false;
                    });

                    final title = 'สำเร็จ';
                    final text = result.error ? (result.errorMessage ?? 'An error occurred') : 'ข้อมูลสินค้าถูกแก้ไขแล้ว';

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(title),
                        content: Text(text),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('ยืนยัน'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    )
                    .then((data) {
                      if (result.data) {
                        Navigator.of(context).pop();
                      }
                    });

                  } else {
                    //Create on API
                    setState(() {
                      _isLoading = true;
                    });
                    final product = ProductManipulation(
                      code: _codeController.text,
                      name: _nameController.text
                    );
                    final result = await productsService.createProduct(product);
                    
                    setState(() {
                      _isLoading = false;
                    });

                    final title = 'สำเร็จ';
                    final text = result.error ? (result.errorMessage ?? 'An error occurred') : 'เพิ่มข้อมูลสินค้าเข้าระบบสำเร็จแล้ว';

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(title),
                        content: Text(text),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('ยืนยัน'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    )
                    .then((data) {
                      if (result.data) {
                        Navigator.of(context).pop();
                      }
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}