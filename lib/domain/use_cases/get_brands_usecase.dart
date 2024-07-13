import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/repository/home_repository_contract.dart';

import '../../data/api/base_error.dart';
import '../entities/CategoryOrBrandsResponseEntity.dart';

class GetBrandsUseCase{
  HomeRepositoryContract homeRepositoryContract;

  GetBrandsUseCase(this.homeRepositoryContract);

  Future<Either<BaseError, CategoryOrBrandsResponseEntity>> invoke(){
    return homeRepositoryContract.getBrands();
  }
}