import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/repository/home_repository_contract.dart';

import '../../data/api/base_error.dart';
import '../entities/ProductsResponseEntity.dart';

class GetBrandProductUseCase{
  HomeRepositoryContract homeRepositoryContract;

  GetBrandProductUseCase(this.homeRepositoryContract);

  Future<Either<BaseError, ProductsResponseEntity>> invoke(String brandId){
   return homeRepositoryContract.getProductByBrandId(brandId);
  }
}