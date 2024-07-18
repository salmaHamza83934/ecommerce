import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/AddRemoveWishlistResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/repository/wishlist_repository_contract.dart';

class WishlistRepositoryImp extends WishlistRepositoryContract{
  WishlistRemoteDataSource wishlistRemoteDataSource;

  WishlistRepositoryImp(this.wishlistRemoteDataSource);

  @override
  Future<Either<BaseError, AddRemoveWishlistResponseEntity>> addToWishlist(String productId) {
    return wishlistRemoteDataSource.addToWishlist(productId);
  }

  @override
  Future<Either<BaseError, AddRemoveWishlistResponseEntity>> removeFromWishlist(String productId) {
    return wishlistRemoteDataSource.removeFromWishlist(productId);

  }

  @override
  Future<Either<BaseError, GetWishlistResponseEntity>> getWishlist() {
    return wishlistRemoteDataSource.getWishlist();

  }

}