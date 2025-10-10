import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/home/data/api_sources/api_sources_home.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repo/product_repo.dart';
import '../mappers/product_mapper.dart';
import '../models/product_model.dart';

class ProductRepoImpl  implements ProductRepo {
  final ApiSourcesHome apiSources;
  ProductRepoImpl({
    required this.apiSources,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final response = await apiSources.getProducts();
      final model = ProductModel.fromJson(response);
      final entities = model.toEntityList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch products'));
    }
  }

}