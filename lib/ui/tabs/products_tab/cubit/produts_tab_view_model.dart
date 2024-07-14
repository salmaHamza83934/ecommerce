import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_cases/get_brands_usecase.dart';
import '../../../../domain/use_cases/get_categories_usecase.dart';
import '../../../home_screen/cubit/home_screen_states.dart';
import 'produts_tab_states.dart';

class ProductsTabViewModel extends Cubit<ProductsTabStates>{
  GetProductsUseCase getProductsUseCase;
  ProductsTabViewModel({required this.getProductsUseCase}):super(ProductsTabInitialState());

  List<ProductEntity> products=[];

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

}