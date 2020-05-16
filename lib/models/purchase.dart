import 'package:json_annotation/json_annotation.dart';

part 'purchase.g.dart';

@JsonSerializable()
class Purchase {
  String noteID;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  DateTime lastestEditDateTime;

  Purchase(
  {this.noteID,
   this.noteTitle,
   this.noteContent,
   this.createDateTime,
   this.lastestEditDateTime});

   factory Purchase.formJson(Map<String, dynamic> item) => _$PurchaseFromJson(item);
}