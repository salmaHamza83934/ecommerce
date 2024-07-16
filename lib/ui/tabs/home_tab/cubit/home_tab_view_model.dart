import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/ProductsResponseEntity.dart';
import '../../../../domain/use_cases/get_brand_product_use_case.dart';
import '../../../../domain/use_cases/get_brands_usecase.dart';
import '../../../../domain/use_cases/get_categories_usecase.dart';
import '../../../../domain/use_cases/get_category_product_use_case.dart';
import '../../../home_screen/cubit/home_screen_states.dart';
import 'home_tab_states.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  GetBrandProductUseCase getBrandProductUseCase;
  GetCategoryProductUseCase getCategoryProductUseCase;

  HomeTabViewModel(
      {required this.getCategoriesUseCase,
      required this.getBrandsUseCase,
      required this.getBrandProductUseCase,
      required this.getCategoryProductUseCase})
      : super(HomeTabInitialState());

  List<CategoryOrBrandsEntity> categoryEntity = [];
  List<CategoryOrBrandsEntity> brandsEntity = [];
  List<ProductEntity> brandProducts=[];
  List<ProductEntity> categoryProducts=[];


  void getAllCategories() async {
    emit(AllCategoriesLoadingState('Loading...'));
    var either = await getCategoriesUseCase.invoke();
    either.fold((l) {
      emit(AllCategoriesErrorState(l));
    }, (response) {
      categoryEntity = response.data ?? [];
      emit(AllCategoriesSuccessState(response));
    });
  }

  void getAllBrands() async {
    emit(AllBrandsLoadingState('Loading...'));
    var either = await getBrandsUseCase.invoke();
    either.fold((l) {
      emit(AllBrandsErrorState(l));
    }, (response) {
      brandsEntity = response.data ?? [];
      emit(AllBrandsSuccessState(response));
    });
  }

  void getProductByBrandId(String brandId) async {
    emit(BrandProductsLoadingState('Loading...'));
    var either = await getBrandProductUseCase.invoke(brandId);
    either.fold((l) {
      emit(BrandProductsErrorState(l));
    }, (response) {
      brandProducts = response.data ?? [];
      emit(BrandProductsSuccessState(response));
    });
  }

  void getProductByCategoryId(String categoryId) async {
    emit(CategoryProductsLoadingState('Loading...'));
    var either = await getCategoryProductUseCase.invoke(categoryId);
    either.fold((l) {
      emit(CategoryProductsErrorState(l));
    }, (response) {
      categoryProducts = response.data ?? [];
      emit(CategoryProductsSuccessState(response));
    });
  }
}
