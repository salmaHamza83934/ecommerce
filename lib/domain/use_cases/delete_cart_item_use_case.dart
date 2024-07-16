import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/repository/cart_repository_contract.dart';

import '../../data/api/base_error.dart';
import '../entities/GetCartRespnseEntity.dart';

class DeleteCartItemUseCase{
  CartRepositoryContract cartRepositoryContract;

  DeleteCartItemUseCase(this.cartRepositoryContract);

  Future<Either<BaseError, GetCartResponseEntity>> invoke(String productId){
    return cartRepositoryContract.deleteCartItems(productId);
  }
}