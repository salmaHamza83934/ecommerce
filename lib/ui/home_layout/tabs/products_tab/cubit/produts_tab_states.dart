import 'package:ecommerce_app/domain/entities/AddRemoveWishlistResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';

import '../../../../../data/api/base_error.dart';

abstract class ProductsTabStates{}

class ProductsTabInitialState extends ProductsTabStates{}

class AllProductsLoadingState extends ProductsTabStates {
  String loadingMsg;

  AllProductsLoadingState(this.loadingMsg);
}

class AllProductsErrorState extends ProductsTabStates {
  BaseError error;

  AllProductsErrorState(this.error);
}

class AllProductsSuccessState extends ProductsTabStates {
  ProductsResponseEntity productsResponseEntity;

  AllProductsSuccessState(this.productsResponseEntity);
}class SearchProductSuccess extends ProductsTabStates {
  List<ProductEntity> productEntity;

  SearchProductSuccess(this.productEntity);
}class SearchProductLoading extends ProductsTabStates {

}

class AddToCartLoadingState extends ProductsTabStates {
  String loadingMsg;

  AddToCartLoadingState(this.loadingMsg);
}

class AddToCartErrorState extends ProductsTabStates {
  BaseError error;

  AddToCartErrorState(this.error);
}

class AddToCartSuccessState extends ProductsTabStates {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessState(this.addToCartResponseEntity);
}

class AddToWishlistSuccessState extends ProductsTabStates{
  AddRemoveWishlistResponseEntity addRemoveWishlistResponseEntity;

  AddToWishlistSuccessState(this.addRemoveWishlistResponseEntity);
}
class AddToWishlistErrorState extends ProductsTabStates{
  BaseError error;

  AddToWishlistErrorState(this.error);
}

class RemoveWishlistSuccessState extends ProductsTabStates{
  AddRemoveWishlistResponseEntity addRemoveWishlistResponseEntity;

  RemoveWishlistSuccessState(this.addRemoveWishlistResponseEntity);
}
class RemoveFromWishlistErrorState extends ProductsTabStates{
  BaseError error;

  RemoveFromWishlistErrorState(this.error);
}
class GetWishlistLoadingState extends ProductsTabStates {
  String loadingMsg;

  GetWishlistLoadingState(this.loadingMsg);
}
class GetWishlistSuccessState extends ProductsTabStates{
  GetWishlistResponseEntity? getWishlistResponseEntity;

  GetWishlistSuccessState({this.getWishlistResponseEntity});
}
class GetWishlistErrorState extends ProductsTabStates{
  BaseError error;

  GetWishlistErrorState(this.error);
}