import 'package:dartz/dartz.dart';

import '../../../data/api/base_error.dart';
import '../../entities/CategoryOrBrandsResponseEntity.dart';

abstract class HomeRemoteDataSource{
  Future<Either<BaseError,CategoryOrBrandsResponseEntity>> getCategories();
  Future<Either<BaseError,CategoryOrBrandsResponseEntity>> getBrands();

}