import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/ProductsResponseEntity.dart';
import '../../../../domain/use_cases/get_categories_usecase.dart';
import '../../../../domain/use_cases/get_category_product_use_case.dart';
import 'home_tab_states.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetCategoryProductUseCase getCategoryProductUseCase;
  GetProductsUseCase getProductsUseCase;

  HomeTabViewModel(
      {required this.getCategoriesUseCase,
      required this.getCategoryProductUseCase,
      required this.getProductsUseCase})
      : super(HomeTabInitialState());

  List<CategoryOrBrandsEntity> categoryEntity = [];
  List<ProductEntity> categoryProducts = [];
  List<ProductEntity> newArrivalProducts = [];

  void getAllCategories() async {
    emit(AllCategoriesLoadingState('Loading...'));
    var either = await getCategoriesUseCase.invoke();
    either.fold(
          (failure) {
        emit(AllCategoriesErrorState(failure));
      },
          (response) {
        if (response.data != null) {
          final filteredCategories = response.data!.where((category) {
            return category.name == 'Men\'s Fashion' ||
                category.name == 'Women\'s Fashion' ||
                category.name == 'Baby & Toys' ||
                category.name == 'Electronics';
          }).toSet();
          // Update the categoryEntity list while ensuring no duplicates
          for (var category in filteredCategories) {
            if (!categoryEntity.any((existing) => existing.id == category.id)) {
              categoryEntity.add(category);
            }
          }
        }
        emit(AllCategoriesSuccessState(response));
      },
    );
  }

  void getNewArrivalProducts() async {
    emit(NewArrivalProductsLoadingState('loading...'));
    var either = await getProductsUseCase.invoke(queryParams: '-createdAt');
    either.fold(
          (failure) {
        emit(NewArrivalProductsErrorState(failure)); // Ensure error state is emitted
      },
          (response) {
        newArrivalProducts = response.data ?? [];
        emit(NewArrivalProductsSuccessState(response)); // Success state
      },
    );
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
