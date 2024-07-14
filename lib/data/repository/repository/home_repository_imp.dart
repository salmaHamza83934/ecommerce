import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract{
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<BaseError, CategoryOrBrandsResponseEntity>> getCategories() {
    return homeRemoteDataSource.getCategories();
  }

  @override
  Future<Either<BaseError, CategoryOrBrandsResponseEntity>> getBrands() {
    // TODO: implement getBrands
    return homeRemoteDataSource.getBrands();
  }

  @override
  Future<Either<BaseError, ProductsResponseEntity>> getProducts() {
    // TODO: implement getProducts
    return homeRemoteDataSource.getProducts();
  }

}