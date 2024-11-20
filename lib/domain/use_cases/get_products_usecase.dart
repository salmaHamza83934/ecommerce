import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/repository/home_repository_contract.dart';

import '../../data/api/base_error.dart';

class GetProductsUseCase{
  HomeRepositoryContract homeRepositoryContract;

  GetProductsUseCase(this.homeRepositoryContract);

  Future<Either<BaseError, ProductsResponseEntity>> invoke({String? queryParams}){
    return homeRepositoryContract.getProducts(queryParams: queryParams);
  }
}