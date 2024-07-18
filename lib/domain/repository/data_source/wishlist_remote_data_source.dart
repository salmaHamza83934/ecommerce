import 'package:dartz/dartz.dart';

import '../../../data/api/base_error.dart';
import '../../entities/AddRemoveWishlistResponseEntity.dart';
import '../../entities/GetWishlistResponseEntity.dart';

abstract class WishlistRemoteDataSource{
  Future<Either<BaseError,AddRemoveWishlistResponseEntity>> addToWishlist(String productId);
  Future<Either<BaseError,AddRemoveWishlistResponseEntity>> removeFromWishlist(String productId);
  Future<Either<BaseError,GetWishlistResponseEntity>> getWishlist();


}