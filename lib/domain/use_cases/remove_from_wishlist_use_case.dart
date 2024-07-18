import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/AddRemoveWishlistResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/repository/wishlist_repository_contract.dart';

import '../../data/api/base_error.dart';

class RemoveFromWishlistUseCase{
  WishlistRepositoryContract wishlistRepositoryContract;

  RemoveFromWishlistUseCase(this.wishlistRepositoryContract);

  Future<Either<BaseError, AddRemoveWishlistResponseEntity>> invoke(String productId){
    return wishlistRepositoryContract.removeFromWishlist(productId);
  }
}