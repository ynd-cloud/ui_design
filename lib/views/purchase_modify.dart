import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_design/models/purchase.dart';
import 'package:ui_design/models/purchase_update.dart';
import 'package:ui_design/services/purchase_service.dart';

class PurchaseModify extends StatefulWidget {
 
  final String noteID;
  PurchaseModify({this.noteID});

  @override
  _PurchaseModifyState createState() => _PurchaseModifyState();
}

class _PurchaseModifyState extends State<PurchaseModify> {
  bool get isEditing => widget.noteID != null;

  PurchaseService get purchasesService => GetIt.I<PurchaseService>();

  String errorMessage;
  Purchase note;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      purchasesService.getPurchase(widget.noteID)
        .then((response) {
          setState(() {
            _isLoading = false;
          });

          if (response.error) {
            errorMessage = response.errorMessage ?? 'An error occurred';
          }
          note = response.data;
          _titleController.text = note.noteTitle;
          _contentController.text = note.noteContent;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Purchase' : 'Create Purchase')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Purchase title'
              ),
            ),

            Container(height: 8),

            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                hintText: 'Purchase content'
              ),
            ),

            Container(height: 16),

            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  if (isEditing) {
                    //Update on API
                    setState(() {
                      _isLoading = true;
                    });
                    final purchase = PurchaseManipulation(
                      noteTitle: _titleController.text,
                      noteContent: _contentController.text
                    );
                    final result = await purchasesService.updatePurchase(widget.noteID, purchase);
                    
                    setState(() {
                      _isLoading = false;
                    });

                    final title = 'Done';
                    final text = result.error ? (result.errorMessage ?? 'An error occurred') : 'Your note was updated';

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(title),
                        content: Text(text),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
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
                    final purchase = PurchaseManipulation(
                      noteTitle: _titleController.text,
                      noteContent: _contentController.text
                    );
                    final result = await purchasesService.createPurchase(purchase);
                    
                    setState(() {
                      _isLoading = false;
                    });

                    final title = 'Done';
                    final text = result.error ? (result.errorMessage ?? 'An error occurred') : 'Your note was created';

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(title),
                        content: Text(text),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
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