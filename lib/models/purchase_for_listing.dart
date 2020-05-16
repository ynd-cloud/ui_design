
import 'package:json_annotation/json_annotation.dart';

part 'purchase_for_listing.g.dart';

@JsonSerializable()
class PurchaseForListing {
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime lastestEditDateTime;

  PurchaseForListing(
      {this.noteID,
      this.noteTitle,
      this.createDateTime,
      this.lastestEditDateTime});

  factory PurchaseForListing.formJson(Map<String, dynamic> item) =>_$PurchaseForListingFromJson(item);
}
