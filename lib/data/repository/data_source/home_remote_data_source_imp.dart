import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/api_manager.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/data_source/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  ApiManager apiManager;
  HomeRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Either<BaseError, CategoryOrBrandsResponseEntity>> getCategories() async{
    var either= await apiManager.getCategories();
    return either.fold((l) {
      return Left(BaseError(errMsg: l.errMsg));
    }, (r){
      return Right(r);
    });
  }

  @override
  Future<Either<BaseError, CategoryOrBrandsResponseEntity>> getBrands()async {
    var either= await apiManager.getBrands();
    return either.fold((l) {
      return Left(BaseError(errMsg: l.errMsg));
    }, (r){
      return Right(r);
    });
  }
}