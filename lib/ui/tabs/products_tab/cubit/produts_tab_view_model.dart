import 'package:ecommerce_app/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_usecase.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_cases/add_to_cart_usecase.dart';
import '../../../../domain/use_cases/add_to_wishlist_use_case.dart';
import '../../../../domain/use_cases/get_brands_usecase.dart';
import '../../../../domain/use_cases/get_categories_usecase.dart';
import '../../../../domain/use_cases/get_wishlist_use_case.dart';
import '../../../../domain/use_cases/remove_from_wishlist_use_case.dart';
import '../../../home_screen/cubit/home_screen_states.dart';
import 'produts_tab_states.dart';

class ProductsTabViewModel extends Cubit<ProductsTabStates> {
  GetProductsUseCase getProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  AddToWishlistUseCase addToWishlistUseCase;
  RemoveFromWishlistUseCase removeFromWishlistUseCase;
  GetWishlistUseCase getWishlistUseCase;
  ProductsTabViewModel(
      {required this.getProductsUseCase,
      required this.addToCartUseCase,
      required this.addToWishlistUseCase,
      required this.removeFromWishlistUseCase,required this.getWishlistUseCase})
      : super(ProductsTabInitialState());

  Set<String> favouriteProductIds = <String>{};
  List<ProductEntity> products = [];
  int numOfCartItems = 0;
  bool isFavourite = false;

  static ProductsTabViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(AllProductsLoadingState('Loading...'));
    var either = await getProductsUseCase.invoke();
    either.fold((l) {
      emit(AllProductsErrorState(l));
    }, (response) {
      products = response.data ?? [];
      emit(AllProductsSuccessState(response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState('Loading...'));
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartErrorState(l));
    }, (response) {
      numOfCartItems = response.numOfCartItems ?? 0;
      print(numOfCartItems);
      emit(AddToCartSuccessState(response));
    });
  }

  void addToWishlist(String productId) async {
    if (favouriteProductIds.contains(productId)) {
      isFavourite = false;
      removeFromWishlist(productId);
      favouriteProductIds.remove(productId);
    } else {
      favouriteProductIds.add(productId);
      isFavourite = true;

    var either = await addToWishlistUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToWishlistErrorState(l));
    }, (response) {
      print(response.data?.length);
      emit(AddToWishlistSuccessState(response));
    });}
  }

  void removeFromWishlist(String productId) async {
    var either = await removeFromWishlistUseCase.invoke(productId);
    either.fold((l) {
      emit(RemoveFromWishlistErrorState(l));
    }, (response) {
      print(response.data?.length);
      favoriteProducts.removeWhere((product) => product.id == productId);
      favouriteProductIds.remove(productId);
      emit(RemoveWishlistSuccessState(response));
      emit(GetWishlistSuccessState());

    });
  }

  List<ProductEntity> favoriteProducts=[];
  void getWishlist() async {
    emit(GetWishlistLoadingState('loading...'));
    var either = await getWishlistUseCase.invoke();
    either.fold((l) {
      emit(GetWishlistErrorState(l));
    }, (response) {
      print(response.data?.length);
      if(response.data?.length !=0){
        favoriteProducts = response.data!;
        favouriteProductIds = favoriteProducts.map((product) => product.id!).toSet();
      }

      emit(GetWishlistSuccessState(getWishlistResponseEntity: response));
    });
  }
}
