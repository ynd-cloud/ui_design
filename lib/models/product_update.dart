

import 'package:flutter/foundation.dart';

class ProductManipulation {
  String code;
  String name;
  String shortName;
  String size;
  bool isEcommerge;
  int productCategoryId;
  String productCategory;
  int productTypeId;
  String productType;
  int productGroupId;
  String productGroup;
  int clientId;
  String client;
  int uomId;
  String uom;
  bool controlExpireDate;
  String description;
  double unitPrice;
  int unitPriceCurrencyId;
  String unitPriceCurrency;
  double standardPack;
  int standardPackUomId;
  String standardPackUom;
  dynamic picture;
  String pictureContentType;
  String mfg;
  bool isActive;
  String createdOn;
  String createdByUserId;
  String createdByUser;
  String updatedOn;
  String updatedByUserId;
  String updatedByUser;

  ProductManipulation(
      {
      @required this.code,
      @required this.name,
      this.shortName,
      this.size,
      this.isEcommerge,
      this.productCategoryId,
      this.productCategory,
      this.productTypeId,
      this.productType,
      this.productGroupId,
      this.productGroup,
      this.clientId,
      this.client,
      this.uomId,
      this.uom,
      this.controlExpireDate,
      this.description,
      this.unitPrice,
      this.unitPriceCurrencyId,
      this.unitPriceCurrency,
      this.standardPack,
      this.standardPackUomId,
      this.standardPackUom,
      this.picture,
      this.pictureContentType,
      this.mfg,
      this.isActive,
      this.createdOn,
      this.createdByUserId,
      this.createdByUser,
      this.updatedOn,
      this.updatedByUserId,
      this.updatedByUser});

  ProductManipulation.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    shortName = json['shortName'];
    size = json['size'];
    isEcommerge = json['isEcommerge'];
    productCategoryId = json['productCategoryId'];
    productCategory = json['productCategory'];
    productTypeId = json['productTypeId'];
    productType = json['productType'];
    productGroupId = json['productGroupId'];
    productGroup = json['productGroup'];
    clientId = json['clientId'];
    client = json['client'];
    uomId = json['uomId'];
    uom = json['uom'];
    controlExpireDate = json['controlExpireDate'];
    description = json['description'];
    unitPrice = json['unitPrice'];
    unitPriceCurrencyId = json['unitPriceCurrencyId'];
    unitPriceCurrency = json['unitPriceCurrency'];
    standardPack = json['standardPack'];
    standardPackUomId = json['standardPackUomId'];
    standardPackUom = json['standardPackUom'];
    picture = json['picture'];
    pictureContentType = json['pictureContentType'];
    mfg = json['mfg'];
    isActive = json['isActive'];
    createdOn = json['createdOn'];
    createdByUserId = json['createdByUserId'];
    createdByUser = json['createdByUser'];
    updatedOn = json['updatedOn'];
    updatedByUserId = json['updatedByUserId'];
    updatedByUser = json['updatedByUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['size'] = this.size;
    data['isEcommerge'] = this.isEcommerge;
    data['productCategoryId'] = this.productCategoryId;
    data['productCategory'] = this.productCategory;
    data['productTypeId'] = this.productTypeId;
    data['productType'] = this.productType;
    data['productGroupId'] = this.productGroupId;
    data['productGroup'] = this.productGroup;
    data['clientId'] = this.clientId;
    data['client'] = this.client;
    data['uomId'] = this.uomId;
    data['uom'] = this.uom;
    data['controlExpireDate'] = this.controlExpireDate;
    data['description'] = this.description;
    data['unitPrice'] = this.unitPrice;
    data['unitPriceCurrencyId'] = this.unitPriceCurrencyId;
    data['unitPriceCurrency'] = this.unitPriceCurrency;
    data['standardPack'] = this.standardPack;
    data['standardPackUomId'] = this.standardPackUomId;
    data['standardPackUom'] = this.standardPackUom;
    data['picture'] = this.picture;
    data['pictureContentType'] = this.pictureContentType;
    data['mfg'] = this.mfg;
    data['isActive'] = this.isActive;
    data['createdOn'] = this.createdOn;
    data['createdByUserId'] = this.createdByUserId;
    data['createdByUser'] = this.createdByUser;
    data['updatedOn'] = this.updatedOn;
    data['updatedByUserId'] = this.updatedByUserId;
    data['updatedByUser'] = this.updatedByUser;
    return data;
  }
}
