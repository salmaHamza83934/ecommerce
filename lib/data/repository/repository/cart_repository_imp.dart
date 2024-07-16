import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/GetCartRespnseEntity.dart';
import 'package:ecommerce_app/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/repository/cart_repository_contract.dart';

class CartRepositoryImp extends CartRepositoryContract{
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImp(this.cartRemoteDataSource);

  @override
  Future<Either<BaseError, GetCartResponseEntity>> getCartItems() {
    return cartRemoteDataSource.getCartItems();

  }

  @override
  Future<Either<BaseError, GetCartResponseEntity>> deleteCartItems(String productId) {
    // TODO: implement deleteCartItems
    return cartRemoteDataSource.deleteCartItems(productId);
  }

  @override
  Future<Either<BaseError, GetCartResponseEntity>> updateCountCart(String productId, int count) {
    // TODO: implement updateCountCart
    return cartRemoteDataSource.updateCountCart(productId,count);
  }
}