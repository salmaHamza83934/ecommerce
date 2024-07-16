import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/api_manager.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/GetCartRespnseEntity.dart';
import 'package:ecommerce_app/domain/repository/data_source/cart_remote_data_source.dart';

class CartRemoteDataSourceImp extends CartRemoteDataSource{
  ApiManager apiManager;

  CartRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<BaseError, GetCartResponseEntity>> getCartItems() async{
    var either= await apiManager.getCartItems();
    return either.fold((l) {
      return Left(BaseError(errMsg: l.errMsg));
    }, (r){
      return Right(r);
    });
  }

  @override
  Future<Either<BaseError, GetCartResponseEntity>> deleteCartItems(String productId) async{
    var either= await apiManager.deleteCartItems(productId);
    return either.fold((l) {
      return Left(BaseError(errMsg: l.errMsg));
    }, (r){
      return Right(r);
    });
  }

  @override
  Future<Either<BaseError, GetCartResponseEntity>> updateCountCart(String productId, int count) async{
    var either= await apiManager.updateCountCart(productId,count);
    return either.fold((l) {
      return Left(BaseError(errMsg: l.errMsg));
    }, (r){
      return Right(r);
    });
  }

}