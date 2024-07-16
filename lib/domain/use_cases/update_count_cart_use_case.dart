import 'package:dartz/dartz.dart';

import '../../data/api/base_error.dart';
import '../entities/GetCartRespnseEntity.dart';
import '../repository/repository/cart_repository_contract.dart';

class UpdateCountCartUseCase{
  CartRepositoryContract cartRepositoryContract;

  UpdateCountCartUseCase(this.cartRepositoryContract);

  Future<Either<BaseError, GetCartResponseEntity>> invoke(String productId,int count){
    return cartRepositoryContract.updateCountCart(productId, count);
  }
}