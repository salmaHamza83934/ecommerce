import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/api_manager.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/AddRemoveWishlistResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/repository/wishlist_repository_contract.dart';

class WishlistRemoteDataSourceImp extends WishlistRemoteDataSource{
  ApiManager apiManager;

  WishlistRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<BaseError, AddRemoveWishlistResponseEntity>> addToWishlist(String productId) async{
    var either= await apiManager.addToWishlist(productId);
    return either.fold((l) {
      return Left(BaseError(errMsg: l.errMsg));
    }, (r){
      return Right(r);
    });
  }

  @override
  Future<Either<BaseError, AddRemoveWishlistResponseEntity>> removeFromWishlist(String productId) async{
    var either= await apiManager.removeFromWishlist(productId);
    return either.fold((l) {
      return Left(BaseError(errMsg: l.errMsg));
    }, (r){
      return Right(r);
    });
  }

  @override
  Future<Either<BaseError, GetWishlistResponseEntity>> getWishlist() async{
    var either= await apiManager.getWishlist();
    return either.fold((l) {
      return Left(BaseError(errMsg: l.errMsg));
    }, (r){
      return Right(r);
    });
  }

}