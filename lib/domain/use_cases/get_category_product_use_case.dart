import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/repository/home_repository_contract.dart';

import '../../data/api/base_error.dart';
import '../entities/ProductsResponseEntity.dart';

class GetCategoryProductUseCase{
  HomeRepositoryContract homeRepositoryContract;

  GetCategoryProductUseCase(this.homeRepositoryContract);

  Future<Either<BaseError, ProductsResponseEntity>> invoke(String categoryId){
   return homeRepositoryContract.getProductByCategoryId(categoryId);
  }
}