import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/data/model/response/CategoryOrBrandsResponseDto.dart';
import 'package:ecommerce_app/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';

abstract class HomeRepositoryContract{
  Future<Either<BaseError,CategoryOrBrandsResponseEntity>> getCategories();
  Future<Either<BaseError,CategoryOrBrandsResponseEntity>> getBrands();
  Future<Either<BaseError,ProductsResponseEntity>> getProducts();
  Future<Either<BaseError,ProductsResponseEntity>> getProductByCategoryId(String categoryId);
  Future<Either<BaseError,ProductsResponseEntity>> getProductByBrandId(String brandId);
  Future<Either<BaseError,AddToCartResponseEntity>> addToCart(String productId);



}