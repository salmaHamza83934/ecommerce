import 'package:dartz/dartz.dart';

import '../../../data/api/base_error.dart';
import '../../entities/GetCartRespnseEntity.dart';

abstract class CartRepositoryContract{
  Future<Either<BaseError,GetCartResponseEntity>> getCartItems();

  Future<Either<BaseError,GetCartResponseEntity>> deleteCartItems(String productId);

  Future<Either<BaseError,GetCartResponseEntity>> updateCountCart(String productId,int count);

}