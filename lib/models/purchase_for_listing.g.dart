// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_for_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseForListing _$PurchaseForListingFromJson(Map<String, dynamic> json) {
  return PurchaseForListing(
    noteID: json['noteID'] as String,
    noteTitle: json['noteTitle'] as String,
    createDateTime: json['createDateTime'] == null
        ? null
        : DateTime.parse(json['createDateTime'] as String),
    lastestEditDateTime: json['lastestEditDateTime'] == null
        ? null
        : DateTime.parse(json['lastestEditDateTime'] as String),
  );
}

// Map<String, dynamic> _$PurchaseForListingToJson(PurchaseForListing instance) =>
//     <String, dynamic>{
//       'noteID': instance.noteID,
//       'noteTitle': instance.noteTitle,
//       'createDateTime': instance.createDateTime?.toIso8601String(),
//       'lastestEditDateTime': instance.lastestEditDateTime?.toIso8601String(),
//     };
