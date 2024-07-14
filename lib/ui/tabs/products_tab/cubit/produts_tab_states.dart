import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';

import '../../../../data/api/base_error.dart';
import '../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';

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
}

