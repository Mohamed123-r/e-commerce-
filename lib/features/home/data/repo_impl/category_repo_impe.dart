import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/home/data/api_sources/api_sources_home.dart';
import 'package:e_commerce/features/home/data/mappers/category_mapper.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/repo/category_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repo/product_repo.dart';
import '../mappers/product_mapper.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class CategoryRepoImpl implements CategoryRepo {
  final ApiSourcesHome apiSources;
  CategoryRepoImpl({
    required this.apiSources,
  });

  @override
  Future <Either<Failure, List<CategoryEntity>>> getCategory()async {
    try {
      final response = await apiSources.getCategories();
      final model = CategoryModel.fromJson(response);
      final entities = model.toEntityList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch Category'));
    }
  }

}