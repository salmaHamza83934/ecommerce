import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:ecommerce_app/ui/login/cubit/login_view_model.dart';
import 'package:ecommerce_app/ui/register/cubit/reigister_view_model.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce_app/data/api/api_manager.dart';
import 'package:ecommerce_app/data/repository/data_source/auth_remote_data_source_imp.dart';
import 'package:ecommerce_app/data/repository/data_source/cart_remote_data_source_imp.dart';
import 'package:ecommerce_app/data/repository/data_source/home_remote_data_source_imp.dart';
import 'package:ecommerce_app/data/repository/data_source/wishlist_remote_data_source_imp.dart';
import 'package:ecommerce_app/data/repository/repository/auth_repository_imp.dart';
import 'package:ecommerce_app/data/repository/repository/cart_repository_imp.dart';
import 'package:ecommerce_app/data/repository/repository/home_repository_imp.dart';
import 'package:ecommerce_app/data/repository/repository/wishlist_repository_imp.dart';
import 'package:ecommerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/repository/auth_repository_contract.dart';
import 'package:ecommerce_app/domain/repository/repository/cart_repository_contract.dart';
import 'package:ecommerce_app/domain/repository/repository/home_repository_contract.dart';
import 'package:ecommerce_app/domain/repository/repository/wishlist_repository_contract.dart';
import 'package:ecommerce_app/domain/use_cases/add_to_cart_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_categories_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/get_category_product_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/get_wishlist_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/login_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/register_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/remove_from_wishlist_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/update_count_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/delete_cart_item_use_case.dart';
import 'package:http/http.dart';

// Initialize GetIt instance
final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  /// API Manager
  getIt.registerLazySingleton(() => ApiManager.getInstance());

  /// Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImp(apiManager: getIt()));
  getIt.registerLazySingleton<AuthRepositoryContract>(
          () => AuthRepositoryImp(getIt()));
  getIt.registerFactory(() => RegisterUseCase(getIt()));
  getIt.registerFactory(() => LoginUseCase(getIt()));
  getIt.registerFactory<LoginScreenViewModel>(
          () => LoginScreenViewModel(loginUseCase: getIt()));
  getIt.registerFactory<RegisterScreenViewModel>(
          () => RegisterScreenViewModel(registerUseCase: getIt()));

  /// Home
  getIt.registerLazySingleton<HomeRemoteDataSource>(
          () => HomeRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<HomeRepositoryContract>(
          () => HomeRepositoryImpl(getIt()));
  getIt.registerFactory(() => GetCategoriesUseCase(getIt()));
  getIt.registerFactory(() => GetProductsUseCase(getIt()));
  getIt.registerFactory(() => GetCategoryProductUseCase(getIt()));
  getIt.registerFactory(() => AddToCartUseCase(getIt()));
  getIt.registerFactory<HomeTabViewModel>(
          () =>
          HomeTabViewModel(getProductsUseCase: getIt(),
              getCategoriesUseCase: getIt(),
              getCategoryProductUseCase: getIt()));
  getIt.registerFactory<HomeScreenViewModel>(
          () =>
          HomeScreenViewModel());

  /// Cart
  getIt.registerLazySingleton<CartRemoteDataSource>(
          () => CartRemoteDataSourceImp(getIt()));
  getIt.registerLazySingleton<CartRepositoryContract>(
          () => CartRepositoryImp(getIt()));
  getIt.registerFactory(() => GetCartUseCase(getIt()));
  getIt.registerFactory(() => DeleteCartItemUseCase(getIt()));
  getIt.registerFactory(() => UpdateCountCartUseCase(getIt()));
  getIt.registerFactory(() =>
      CartTabViewModel(addToCartUseCase: getIt(),
          getCartUseCase: getIt(),
          deleteCartUseCase: getIt(),
          updateCountCartUseCase: getIt()));

  /// Wishlist
  getIt.registerLazySingleton<WishlistRemoteDataSource>(
          () => WishlistRemoteDataSourceImp(getIt()));
  getIt.registerLazySingleton<WishlistRepositoryContract>(
          () => WishlistRepositoryImp(getIt()));
  getIt.registerFactory(() => AddToWishlistUseCase(getIt()));
  getIt.registerFactory(() => RemoveFromWishlistUseCase(getIt()));
  getIt.registerFactory(() => GetWishlistUseCase(getIt()));


  getIt.registerFactory<ProductsTabViewModel>(() =>
      ProductsTabViewModel(getProductsUseCase: getIt(),
          addToCartUseCase: getIt(),
          addToWishlistUseCase: getIt(),
          removeFromWishlistUseCase: getIt(),
          getWishlistUseCase: getIt()));
}
