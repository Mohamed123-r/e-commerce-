import 'dart:convert';

class Items {
  Items({
    this.id,
    this.productCode,
    this.name,
    this.description,
    this.arabicName,
    this.arabicDescription,
    this.coverPictureUrl,
    this.productPictures,
    this.price,
    this.stock,
    this.weight,
    this.color,
    this.rating,
    this.reviewsCount,
    this.discountPercentage,
    this.sellerId,
    this.categories,
  });

  Items.fromJson(dynamic json) {
    id = json['id'];
    productCode = json['productCode'];
    name = json['name'];
    description = json['description'];
    arabicName = json['arabicName'];
    arabicDescription = json['arabicDescription'];
    coverPictureUrl = json['coverPictureUrl'];
    productPictures = json['productPictures'];
    price = json['price'];
    stock = json['stock'];
    weight = json['weight'];
    color = json['color'];
    rating = json['rating'];
    reviewsCount = json['reviewsCount'];
    discountPercentage = json['discountPercentage'];
    sellerId = json['sellerId'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
  }

  String? id;
  String? productCode;
  String? name;
  String? description;
  String? arabicName;
  String? arabicDescription;
  String? coverPictureUrl;
  dynamic productPictures;
  num? price;
  num? stock;
  num? weight;
  String? color;
  num? rating;
  num? reviewsCount;
  num? discountPercentage;
  String? sellerId;
  List<String>? categories;

  Items copyWith({
    String? id,
    String? productCode,
    String? name,
    String? description,
    String? arabicName,
    String? arabicDescription,
    String? coverPictureUrl,
    dynamic productPictures,
    num? price,
    num? stock,
    num? weight,
    String? color,
    num? rating,
    num? reviewsCount,
    num? discountPercentage,
    String? sellerId,
    List<String>? categories,
  }) =>
      Items(
        id: id ?? this.id,
        productCode: productCode ?? this.productCode,
        name: name ?? this.name,
        description: description ?? this.description,
        arabicName: arabicName ?? this.arabicName,
        arabicDescription: arabicDescription ?? this.arabicDescription,
        coverPictureUrl: coverPictureUrl ?? this.coverPictureUrl,
        productPictures: productPictures ?? this.productPictures,
        price: price ?? this.price,
        stock: stock ?? this.stock,
        weight: weight ?? this.weight,
        color: color ?? this.color,
        rating: rating ?? this.rating,
        reviewsCount: reviewsCount ?? this.reviewsCount,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        sellerId: sellerId ?? this.sellerId,
        categories: categories ?? this.categories,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productCode'] = productCode;
    map['name'] = name;
    map['description'] = description;
    map['arabicName'] = arabicName;
    map['arabicDescription'] = arabicDescription;
    map['coverPictureUrl'] = coverPictureUrl;
    map['productPictures'] = productPictures;
    map['price'] = price;
    map['stock'] = stock;
    map['weight'] = weight;
    map['color'] = color;
    map['rating'] = rating;
    map['reviewsCount'] = reviewsCount;
    map['discountPercentage'] = discountPercentage;
    map['sellerId'] = sellerId;
    map['categories'] = categories;
    return map;
  }
}

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));
String itemsToJson(Items data) => json.encode(data.toJson());