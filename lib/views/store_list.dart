import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_design/models/api_response.dart';
import 'package:ui_design/models/product_for_listing.dart';
import 'package:ui_design/services/product_service.dart';
import 'package:ui_design/views/product_delete.dart';
import 'package:ui_design/views/product_modify.dart';

class StoreListPage extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreListPage> {
  ProductService get productService => GetIt.I<ProductService>();

  APIResponse<List<ProductForListing>> _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
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
        // appBar: AppBar(title: Text('รายการสินค้า ${_apiResponse.data.length.toString()} รายการ')),
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
                  Divider(height: 1, color: Colors.blue),
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(_apiResponse.data[index].id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (_) => ProductDelete());

                    if (result) {
                      final deleteResult = await productService
                          .deleteProduct(_apiResponse.data[index].id);
                      var message = '';

                      if (deleteResult != null && deleteResult.data == true) {
                        message = 'ลบข้อมูลสินค้าสำเร็จแล้ว';
                      } else {
                        message =
                            deleteResult?.errorMessage ?? 'An error occrued';
                      }
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(message),
                          duration: new Duration(milliseconds: 1000)));

                      return deleteResult.data ?? false;
                    }
                    print(result);
                    return result;
                  },
                  // background: Container(
                  //   color: Colors.red,
                  //   padding: EdgeInsets.all(10),
                  //   child: Align(
                  //     child: Icon(Icons.delete, color: Colors.white),
                  //     alignment: Alignment.centerLeft,
                  //   ),
                  // ),
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: CustomListItem(
                        picture: Container(
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/ngimg.png')),
                          ),
                        ),
                        name: '${_apiResponse.data[index].name}',
                        code: '${_apiResponse.data[index].code}',
                        price:
                            'ราคาต่อชื้น ${_apiResponse.data[index].unitPrice.toStringAsFixed(2)} บาท',
                        qty:
                            'จำนวน ${_apiResponse.data[index].standardPack.toString()} ชิ้น',
                        totalPrice:
                            'ราคารวม ${_apiResponse.data[index].unitPrice.toStringAsFixed(2)} บาท',
                      ),
                    ),
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

            // return ListView(
            //   padding: const EdgeInsets.all(10.0),
            //   children: <Widget>[
            //     CustomListItemTwo(
            //       thumbnail: Container(
            //         decoration: const BoxDecoration(color: Colors.pink),
            //       ),
            //       code: 'Flutter 1.0 Launch',
            //       name:
            //           'Flutter continues to improve and expand its horizons.'
            //           'This text should max out at two lines and clip',
            //       price: 'Dash',
            //       qty: 'Dec 28',
            //       totalPrice: '5 mins',
            //     ),
            //   ],
            // );
          },
        ));
  }
}

class CustomListItem extends StatelessWidget {
  CustomListItem({
    Key key,
    this.picture,
    this.name,
    this.code,
    this.price,
    this.qty,
    this.totalPrice,
  }) : super(key: key);

  final Widget picture;
  final String name;
  final String code;
  final String price;
  final String qty;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: picture,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  name: name,
                  code: code,
                  price: price,
                  qty: qty,
                  totalPrice: totalPrice,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.name,
    this.code,
    this.price,
    this.qty,
    this.totalPrice,
  }) : super(key: key);

  final String name;
  final String code;
  final String price;
  final String qty;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$name',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2)),
              Text(
                '$code',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '$price',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '$qty',
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '$totalPrice',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
