import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/AddToCartEntity.dart';

import '../../data/api/base_error.dart';
import '../repository/repository/home_repository_contract.dart';

class AddToCartUseCase{
  HomeRepositoryContract homeRepositoryContract;

  AddToCartUseCase(this.homeRepositoryContract);

  Future<Either<BaseError, AddToCartResponseEntity>> invoke(String productId){
    return homeRepositoryContract.addToCart(productId);
  }
}