import 'package:flutter/foundation.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../models/category_model.dart';
import '../models/item_model.dart';
import '../models/product_model.dart';

extension CategoryMapper on Categories {
  CategoryEntity toEntity() => CategoryEntity(
    id: id ?? '',
    name: name ?? '',
    description: description ?? '',
    imageUrl: coverPictureUrl ?? '',
  );
}

extension CategoryModelMapper on CategoryModel {
  List<CategoryEntity> toEntityList() =>
      categories?.map((category) => category.toEntity()).toList() ?? [];
}
