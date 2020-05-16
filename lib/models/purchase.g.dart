// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchase _$PurchaseFromJson(Map<String, dynamic> json) {
  return Purchase(
    noteID: json['noteID'] as String,
    noteTitle: json['noteTitle'] as String,
    noteContent: json['noteContent'] as String,
    createDateTime: json['createDateTime'] == null
        ? null
        : DateTime.parse(json['createDateTime'] as String),
    lastestEditDateTime: json['lastestEditDateTime'] == null
        ? null
        : DateTime.parse(json['lastestEditDateTime'] as String),
  );
}

// Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
//       'noteID': instance.noteID,
//       'noteTitle': instance.noteTitle,
//       'noteContent': instance.noteContent,
//       'createDateTime': instance.createDateTime?.toIso8601String(),
//       'lastestEditDateTime': instance.lastestEditDateTime?.toIso8601String(),
//     };
