import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_usecase.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_cases/add_to_cart_usecase.dart';
import '../../../../domain/use_cases/get_brands_usecase.dart';
import '../../../../domain/use_cases/get_categories_usecase.dart';
import '../../../home_screen/cubit/home_screen_states.dart';
import 'produts_tab_states.dart';

class ProductsTabViewModel extends Cubit<ProductsTabStates>{
  GetProductsUseCase getProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  ProductsTabViewModel({required this.getProductsUseCase,required this.addToCartUseCase}):super(ProductsTabInitialState());

  List<ProductEntity> products=[];
  int numOfCartItems=0;

  static ProductsTabViewModel get(context)=>BlocProvider.of(context);

  void getAllProducts() async{
    emit(AllProductsLoadingState('Loading...'));
    var either=await getProductsUseCase.invoke();
    either.fold((l){
      emit(AllProductsErrorState(l));
    }, (response) {
      products=response.data??[];
      emit(AllProductsSuccessState(response));
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

}