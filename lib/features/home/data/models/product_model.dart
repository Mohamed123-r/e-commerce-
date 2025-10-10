import 'dart:convert';

import 'item_model.dart';

class ProductModel {
  ProductModel({
    this.items,
    this.page,
    this.pageSize,
    this.totalCount,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  ProductModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    page = json['page'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }

  List<Items>? items;
  num? page;
  num? pageSize;
  num? totalCount;
  bool? hasNextPage;
  bool? hasPreviousPage;

  ProductModel copyWith({
    List<Items>? items,
    num? page,
    num? pageSize,
    num? totalCount,
    bool? hasNextPage,
    bool? hasPreviousPage,
  }) =>
      ProductModel(
        items: items ?? this.items,
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        totalCount: totalCount ?? this.totalCount,
        hasNextPage: hasNextPage ?? this.hasNextPage,
        hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['page'] = page;
    map['pageSize'] = pageSize;
    map['totalCount'] = totalCount;
    map['hasNextPage'] = hasNextPage;
    map['hasPreviousPage'] = hasPreviousPage;
    return map;
  }
}

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());