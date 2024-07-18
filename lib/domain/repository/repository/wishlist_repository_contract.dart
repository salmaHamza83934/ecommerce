import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/AddRemoveWishlistResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/GetWishlistResponseEntity.dart';

abstract class WishlistRepositoryContract{
  Future<Either<BaseError,AddRemoveWishlistResponseEntity>> addToWishlist(String productId);
  Future<Either<BaseError,AddRemoveWishlistResponseEntity>> removeFromWishlist(String productId);
  Future<Either<BaseError,GetWishlistResponseEntity>> getWishlist();


}