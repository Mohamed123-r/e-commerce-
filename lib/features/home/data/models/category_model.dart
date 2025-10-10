import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());
class CategoryModel {
  CategoryModel({
      this.categories,});

  CategoryModel.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }
  List<Categories>? categories;
CategoryModel copyWith({  List<Categories>? categories,
}) => CategoryModel(  categories: categories ?? this.categories,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      this.id, 
      this.name, 
      this.description, 
      this.coverPictureUrl,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    coverPictureUrl = json['coverPictureUrl'];
  }
  String? id;
  String? name;
  String? description;
  String? coverPictureUrl;
Categories copyWith({  String? id,
  String? name,
  String? description,
  String? coverPictureUrl,
}) => Categories(  id: id ?? this.id,
  name: name ?? this.name,
  description: description ?? this.description,
  coverPictureUrl: coverPictureUrl ?? this.coverPictureUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['coverPictureUrl'] = coverPictureUrl;
    return map;
  }

}