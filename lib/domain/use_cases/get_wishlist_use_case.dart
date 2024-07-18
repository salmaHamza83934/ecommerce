import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/repository/wishlist_repository_contract.dart';

import '../../data/api/base_error.dart';
import '../entities/GetWishlistResponseEntity.dart';

class GetWishlistUseCase{
  WishlistRepositoryContract wishlistRepositoryContract;

  GetWishlistUseCase(this.wishlistRepositoryContract);

  Future<Either<BaseError, GetWishlistResponseEntity>> invoke(){
    return wishlistRepositoryContract.getWishlist();
  }
}