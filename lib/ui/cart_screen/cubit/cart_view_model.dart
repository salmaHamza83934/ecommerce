import 'package:ecommerce_app/domain/entities/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_usecase.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_cases/add_to_cart_usecase.dart';
import '../../../../domain/use_cases/get_brands_usecase.dart';
import '../../../../domain/use_cases/get_categories_usecase.dart';
import '../../../domain/entities/GetCartRespnseEntity.dart';
import '../../../domain/use_cases/delete_cart_item_use_case.dart';
import '../../../domain/use_cases/update_count_cart_use_case.dart';
import 'cart_states.dart';

class CartTabViewModel extends Cubit<CartStates>{
  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  DeleteCartItemUseCase deleteCartUseCase;
  UpdateCountCartUseCase updateCountCartUseCase;
  CartTabViewModel({required this.addToCartUseCase,required this.getCartUseCase,required this.deleteCartUseCase,required this.updateCountCartUseCase}):super(CartInitialState());

  List<GetProductCartEntity> cartProducts=[];
  num? cartTotalPrice;
  int numOfCartItems=0;

  static CartTabViewModel get(context)=>BlocProvider.of(context);


  void getCartItems() async{
    emit(GetCartLoadingState('Loading...'));
    var either=await getCartUseCase.invoke();
    either.fold((l){
      emit(GetCartErrorState(l));
    }, (response) {
      cartTotalPrice=response.data?.totalCartPrice;
      numOfCartItems=response.numOfCartItems??0;
      cartProducts=response.data?.products??[];
      print(numOfCartItems);
      emit(GetCartSuccessState(response));
    });
  }

  void addToCart(String productId) async{
    emit(AddToCartLoadingState('Loading...'));
    var either=await addToCartUseCase.invoke(productId);
    either.fold((l){
      emit(AddToCartErrorState(l));
    }, (response) {
      numOfCartItems=response.numOfCartItems??0;
      print(numOfCartItems);
      emit(AddToCartSuccessState(response));
    });
  }
  void deleteCartItems(String productId) async{
    emit(DeleteCartLoadingState('Loading...'));
    var either=await deleteCartUseCase.invoke(productId);
    either.fold((l){
      emit(DeleteCartErrorState(l));
    }, (response) {
      cartTotalPrice=response.data?.totalCartPrice;
      cartProducts=response.data?.products??[];
      emit(DeleteCartSuccessState(response));
      emit(GetCartSuccessState(response));
    });
  }

  void updateCountCart(String productId,int count) async{
    emit(UpdateCartLoadingState('Loading...'));
    var either=await updateCountCartUseCase.invoke(productId,count);
    either.fold((l){
      emit(UpdateCartErrorState(l));
    }, (response) {
      cartTotalPrice=response.data?.totalCartPrice;
      cartProducts=response.data?.products??[];
      emit(UpdateCartSuccessState(response));
      emit(GetCartSuccessState(response));
    });
  }

}