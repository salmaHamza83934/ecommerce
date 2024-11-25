import 'package:ecommerce_app/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/use_cases/add_to_cart_usecase.dart';
import '../../../../../domain/use_cases/add_to_wishlist_use_case.dart';
import '../../../../../domain/use_cases/get_wishlist_use_case.dart';
import '../../../../../domain/use_cases/remove_from_wishlist_use_case.dart';
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
      required this.removeFromWishlistUseCase,
      required this.getWishlistUseCase})
      : super(ProductsTabInitialState());

  Set<String> favouriteProductIds = <String>{};
  List<ProductEntity> products = [];
  bool isFavourite = false;
  List<ProductEntity> filteredProducts = [];

  static ProductsTabViewModel get(context) => BlocProvider.of(context);

  void getAllProducts({String? query}) async {
    emit(AllProductsLoadingState('Loading...'));
    var either = await getProductsUseCase.invoke();
    either.fold((l) {
      emit(AllProductsErrorState(l));
    }, (response) {
      products = response.data ?? [];
      if (query != null) {
        filteredProducts = products
            .where((product) => product.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      emit(AllProductsSuccessState(response));
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
        emit(AddToWishlistSuccessState(response));
        getWishlist();
      });
    }
  }

  void removeFromWishlist(String productId) async {
    var either = await removeFromWishlistUseCase.invoke(productId);
    either.fold((l) {
      emit(RemoveFromWishlistErrorState(l));
    }, (response) {
      favoriteProducts.removeWhere((product) => product.id == productId);
      favouriteProductIds.remove(productId);
      emit(RemoveWishlistSuccessState(response));
      getWishlist();
    });
  }

  List<ProductEntity> favoriteProducts = [];

  void getWishlist() async {
    emit(GetWishlistLoadingState('loading...'));
    var either = await getWishlistUseCase.invoke();
    either.fold((l) {
      emit(GetWishlistErrorState(l));
    }, (response) {
      if (response.data?.length != 0) {
        favoriteProducts = response.data!;
        favouriteProductIds =
            favoriteProducts.map((product) => product.id!).toSet();
      }

      emit(GetWishlistSuccessState(getWishlistResponseEntity: response));
    });
  }
}
