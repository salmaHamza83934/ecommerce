import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';

import '../../../data/api/base_error.dart';
import '../../entities/AddToCartEntity.dart';
import '../../entities/CategoryOrBrandsResponseEntity.dart';

abstract class HomeRemoteDataSource{
  Future<Either<BaseError,CategoryOrBrandsResponseEntity>> getCategories();
  Future<Either<BaseError,CategoryOrBrandsResponseEntity>> getBrands();
  Future<Either<BaseError,ProductsResponseEntity>> getProducts();
  Future<Either<BaseError,ProductsResponseEntity>> getProductByCategoryId(String categoryId);
  Future<Either<BaseError,ProductsResponseEntity>> getProductByBrandId(String brandId);
  Future<Either<BaseError,AddToCartResponseEntity>> addToCart(String productId);


}