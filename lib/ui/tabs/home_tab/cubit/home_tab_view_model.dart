import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_cases/get_brands_usecase.dart';
import '../../../../domain/use_cases/get_categories_usecase.dart';
import '../../../home_screen/cubit/home_screen_states.dart';
import 'home_tab_states.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  HomeTabViewModel({required this.getCategoriesUseCase, required this.getBrandsUseCase}):super(HomeTabInitialState());

  List<CategoryOrBrandsEntity> categoryEntity=[];
  List<CategoryOrBrandsEntity> brandsEntity=[];


  void getAllCategories() async{
    emit(AllCategoriesLoadingState('Loading...'));
    var either=await getCategoriesUseCase.invoke();
    either.fold((l){
      emit(AllCategoriesErrorState(l));
    }, (response) {
      categoryEntity=response.data??[];
      emit(AllCategoriesSuccessState(response));
    });
  }

  void getAllBrands() async{
    emit(AllBrandsLoadingState('Loading...'));
    var either=await getBrandsUseCase.invoke();
    either.fold((l){
      emit(AllBrandsErrorState(l));
    }, (response) {
      brandsEntity=response.data??[];
      emit(AllBrandsSuccessState(response));
    });
  }

}