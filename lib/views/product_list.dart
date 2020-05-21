import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_design/models/api_response.dart';
import 'package:ui_design/models/product_for_listing.dart';
import 'package:ui_design/services/product_service.dart';
import 'package:ui_design/views/product_delete.dart';
import 'package:ui_design/views/product_modify.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductListPage> {
  ProductService get productService => GetIt.I<ProductService>();

  APIResponse<List<ProductForListing>> _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchProducts();
    super.initState();
  }

  _fetchProducts() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await productService.getProductsList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('รายการสินค้า')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ProductModify()))
                .then((_) {
                  _fetchProducts();
                });
          },
          child: Icon(Icons.add),
        ),
        body: Builder(
          builder: (_) {
            if (_isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (_apiResponse.error) {
              return Center(child: Text(_apiResponse.errorMessage));
            }

            return ListView.separated(
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: Colors.green),
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(_apiResponse.data[index].id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (_) => ProductDelete());

                    
                    if (result) {
                      final deleteResult = await productService.deleteProduct(_apiResponse.data[index].id);
                      var message = '';

                      if (deleteResult != null && deleteResult.data == true) {
                        message = 'ลบข้อมูลสินค้าสำเร็จแล้ว';
                      } else {
                        message = deleteResult?.errorMessage ?? 'An error occrued';
                      }
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message),duration: new Duration(milliseconds: 1000)));

                      return deleteResult.data ?? false;
                    } 
                    print(result);
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      child: Icon(Icons.delete, color: Colors.white),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      _apiResponse.data[index].id.toString(),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                        'แก้ไขล่าสุดวันที่ ${formatDateTime(_apiResponse.data[index].updatedOn ?? _apiResponse.data[index].createdOn)}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ProductModify(
                              rowID: _apiResponse.data[index].id))).then((data) {
                                _fetchProducts();
                              });
                    },
                  ),
                );
              },
              itemCount: _apiResponse.data.length,
            );
          },
        ));
  }
}
