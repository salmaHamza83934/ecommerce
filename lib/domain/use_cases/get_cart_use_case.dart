import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/GetCartRespnseEntity.dart';
import 'package:ecommerce_app/domain/repository/repository/cart_repository_contract.dart';

import '../../data/api/base_error.dart';

class GetCartUseCase{
  CartRepositoryContract cartRepositoryContract;

  GetCartUseCase(this.cartRepositoryContract);

  Future<Either<BaseError, GetCartResponseEntity>> invoke(){
    return cartRepositoryContract.getCartItems();
  }

}