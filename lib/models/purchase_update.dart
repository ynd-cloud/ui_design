import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchase_update.g.dart';

@JsonSerializable()
class PurchaseManipulation {
  String noteTitle;
  String noteContent;

  PurchaseManipulation({
    @required this.noteTitle,
    @required this.noteContent,
  });

  Map<String, dynamic> toJson() => _$PurchaseManipulationToJson(this);
}
