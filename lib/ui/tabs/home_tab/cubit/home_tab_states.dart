import '../../../../data/api/base_error.dart';
import '../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';

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


class AllBrandsLoadingState extends HomeTabStates {
  String loadingMsg;

  AllBrandsLoadingState(this.loadingMsg);
}

class AllBrandsErrorState extends HomeTabStates {
  BaseError error;

  AllBrandsErrorState(this.error);
}

class AllBrandsSuccessState extends HomeTabStates {
  CategoryOrBrandsResponseEntity brandsResponseEntity;

  AllBrandsSuccessState(this.brandsResponseEntity);
}
