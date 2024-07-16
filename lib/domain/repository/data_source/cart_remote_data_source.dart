import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/GetCartRespnseEntity.dart';

abstract class CartRemoteDataSource{
  Future<Either<BaseError,GetCartResponseEntity>> getCartItems();

  Future<Either<BaseError,GetCartResponseEntity>> deleteCartItems(String productId);

  Future<Either<BaseError,GetCartResponseEntity>> updateCountCart(String productId,int count);

}