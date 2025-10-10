

import '../../domain/entities/product_entity.dart';
import '../models/item_model.dart';
import '../models/product_model.dart';

extension ItemsMapper on Items {
  ProductEntity toEntity() => ProductEntity(
    id: id ?? '',
    name: name ?? '',
    description: description ?? '',
    price: price?.toDouble() ?? 0.0,
    imageUrl: coverPictureUrl ?? '',
  );
}

extension ProductModelMapper on ProductModel {
  List<ProductEntity> toEntityList() => items?.map((item) => item.toEntity()).toList() ?? [];
}