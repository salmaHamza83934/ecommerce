

import '../../../../../data/api/base_error.dart';
import '../../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';
import '../../../../../domain/entities/ProductsResponseEntity.dart';

abstract class HomeTabStates{}

class HomeTabInitialState extends HomeTabStates{}

class AllCategoriesLoadingState extends HomeTabStates {
  String loadingMsg;

  AllCategoriesLoadingState(this.loadingMsg);
}

class AllCategoriesErrorState extends HomeTabStates {
  BaseError error;

  AllCategoriesErrorState(this.error);
}

class AllCategoriesSuccessState extends HomeTabStates {
  CategoryOrBrandsResponseEntity categoryResponseEntity;

  AllCategoriesSuccessState(this.categoryResponseEntity);
}



class CategoryProductsLoadingState extends HomeTabStates {
  String loadingMsg;

  CategoryProductsLoadingState(this.loadingMsg);
}

class CategoryProductsErrorState extends HomeTabStates {
  BaseError error;

  CategoryProductsErrorState(this.error);
}

class CategoryProductsSuccessState extends HomeTabStates {
  ProductsResponseEntity productsResponseEntity;

  CategoryProductsSuccessState(this.productsResponseEntity);
}
class NewArrivalProductsLoadingState extends HomeTabStates {
  String loadingMsg;

  NewArrivalProductsLoadingState(this.loadingMsg);
}

class NewArrivalProductsErrorState extends HomeTabStates {
  BaseError error;

  NewArrivalProductsErrorState(this.error);
}

class NewArrivalProductsSuccessState extends HomeTabStates {
  ProductsResponseEntity productsResponseEntity;

  NewArrivalProductsSuccessState(this.productsResponseEntity);
}

