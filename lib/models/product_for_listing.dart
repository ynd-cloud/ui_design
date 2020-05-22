class ProductForListing {
  int id;
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
  DateTime createdOn;
  String createdByUserId;
  String createdByUser;
  DateTime updatedOn;
  String updatedByUserId;
  String updatedByUser;

  ProductForListing(
      {this.id,
      this.code,
      this.name,
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

  factory ProductForListing.fromJson(Map<String, dynamic> item) {
    return ProductForListing(
      id: item['id'],
      code: item['code'],
      name: item['name'],
      shortName: item['shortName'],
      size: item['size'],
      isEcommerge: item['isEcommerge'],
      productCategoryId: item['productCategoryId'],
      productCategory: item['productCategory'],
      productTypeId: item['productTypeId'],
      productType: item['productType'],
      productGroupId: item['productGroupId'],
      productGroup: item['productGroup'],
      clientId: item['clientId'],
      client: item['client'],
      uomId: item['uomId'],
      uom: item['uom'],
      controlExpireDate: item['controlExpireDate'],
      description: item['description'],
      unitPrice: item['unitPrice'],
      unitPriceCurrencyId: item['unitPriceCurrencyId'],
      unitPriceCurrency: item['unitPriceCurrency'],
      standardPack: item['standardPack'],
      standardPackUomId: item['standardPackUomId'],
      standardPackUom: item['standardPackUom'],
      picture: item['picture'],
      pictureContentType: item['pictureContentType'],
      mfg: item['mfg'],
      isActive: item['isActive'],
      createdOn: DateTime.parse(item['createdOn']),
      createdByUserId: item['createdByUserId'],
      createdByUser: item['createdByUser'],
      updatedOn: DateTime.parse(item['updatedOn']),
      updatedByUserId: item['updatedByUserId'],
      updatedByUser: item['updatedByUser'],
    );
  }
}
