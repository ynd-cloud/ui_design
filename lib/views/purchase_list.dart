import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_design/models/api_response.dart';
import 'package:ui_design/models/purchase_for_listing.dart';
import 'package:ui_design/services/purchase_service.dart';
import 'package:ui_design/views/purchase_delete.dart';
import 'package:ui_design/views/purchase_modify.dart';

class PurchaseListPage extends StatefulWidget {
  @override
  _PurchaseListState createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseListPage> {
  PurchaseService get service => GetIt.I<PurchaseService>();

  APIResponse<List<PurchaseForListing>> _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchPurchases();
    super.initState();
  }

  _fetchPurchases() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getPurchasesList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('List of Purchases')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => PurchaseModify()))
                .then((_) {
                  _fetchPurchases();
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
                  key: ValueKey(_apiResponse.data[index].noteID),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (_) => PurchaseDelete());

                    
                    if (result) {
                      final deleteResult = await service.deletePurchase(_apiResponse.data[index].noteID);
                      var message = '';

                      if (deleteResult != null && deleteResult.data == true) {
                        message = 'The Purchase was deleted successfully';
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
                      _apiResponse.data[index].noteTitle,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                        'Last edited on ${formatDateTime(_apiResponse.data[index].lastestEditDateTime ?? _apiResponse.data[index].createDateTime)}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => PurchaseModify(
                              noteID: _apiResponse.data[index].noteID))).then((data) {
                                _fetchPurchases();
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
