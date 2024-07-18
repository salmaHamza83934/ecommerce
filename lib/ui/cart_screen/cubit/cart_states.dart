import 'package:ecommerce_app/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entities/GetCartRespnseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';

import '../../../../data/api/base_error.dart';
import '../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';

abstract class CartStates{}

class CartInitialState extends CartStates{}

class GetCartLoadingState extends CartStates {
  String loadingMsg;

  GetCartLoadingState(this.loadingMsg);
}

class GetCartErrorState extends CartStates {
  BaseError error;

  GetCartErrorState(this.error);
}

class GetCartSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  GetCartSuccessState(this.getCartResponseEntity);
}

class DeleteCartLoadingState extends CartStates {
  String loadingMsg;

  DeleteCartLoadingState(this.loadingMsg);
}

class DeleteCartErrorState extends CartStates {
  BaseError error;

  DeleteCartErrorState(this.error);
}

class DeleteCartSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  DeleteCartSuccessState(this.getCartResponseEntity);
}

class UpdateCartLoadingState extends CartStates {
  String loadingMsg;

  UpdateCartLoadingState(this.loadingMsg);
}

class UpdateCartErrorState extends CartStates {
  BaseError error;

  UpdateCartErrorState(this.error);
}

class UpdateCartSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  UpdateCartSuccessState(this.getCartResponseEntity);
}
class AddToCartLoadingState extends CartStates {
  String loadingMsg;

  AddToCartLoadingState(this.loadingMsg);
}

class AddToCartErrorState extends CartStates {
  BaseError error;

  AddToCartErrorState(this.error);
}

class AddToCartSuccessState extends CartStates {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessState(this.addToCartResponseEntity);
}
