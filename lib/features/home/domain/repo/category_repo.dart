import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class CategoryRepo {
  Future <Either<Failure, List<CategoryEntity>>> getCategory();
}