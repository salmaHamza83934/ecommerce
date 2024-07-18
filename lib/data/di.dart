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
import 'package:ecommerce_app/domain/repository/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/repository/auth_repository_contract.dart';
import 'package:ecommerce_app/domain/repository/repository/cart_repository_contract.dart';
import 'package:ecommerce_app/domain/repository/repository/home_repository_contract.dart';
import 'package:ecommerce_app/domain/repository/repository/wishlist_repository_contract.dart';
import 'package:ecommerce_app/domain/use_cases/add_to_cart_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_brands_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_categories_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/get_category_product_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/get_wishlist_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/login_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/register_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/remove_from_wishlist_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/update_count_cart_use_case.dart';

import '../domain/repository/data_source/cart_remote_data_source.dart';
import '../domain/use_cases/delete_cart_item_use_case.dart';
import '../domain/use_cases/get_brand_product_use_case.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(injectAuthRepository());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(injectAuthRepository());
}
AuthRepositoryContract injectAuthRepository(){
  return AuthRepositoryImp(injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImp(apiManager: ApiManager.getInstance());
}


GetCategoriesUseCase injectGetCategoriesUseCase(){
  return GetCategoriesUseCase(injectHomeRepository());
}
GetBrandsUseCase injectGetBrandsUseCase(){
  return GetBrandsUseCase(injectHomeRepository());
}
GetProductsUseCase injectGetProductsUseCase(){
  return GetProductsUseCase(injectHomeRepository());
}
AddToCartUseCase injectAddToCartUseCase(){
  return AddToCartUseCase(injectHomeRepository());
}

HomeRepositoryContract injectHomeRepository(){
  return HomeRepositoryImpl(injectHomeRemoteDataSource());
}
HomeRemoteDataSource injectHomeRemoteDataSource(){
  return HomeRemoteDataSourceImpl(ApiManager.getInstance());
}
GetCartUseCase injectGetCartUseCase(){
  return GetCartUseCase(injectCartRepositoryContract());
}
CartRepositoryContract injectCartRepositoryContract(){
  return CartRepositoryImp(injectCartRemoteDataSource());
}
CartRemoteDataSource injectCartRemoteDataSource(){
  return CartRemoteDataSourceImp(ApiManager.getInstance());
}
DeleteCartItemUseCase injectDeleteCartItemUseCase(){
  return DeleteCartItemUseCase(injectCartRepositoryContract());
}
UpdateCountCartUseCase injectUpdateCountCartUseCase(){
  return UpdateCountCartUseCase(injectCartRepositoryContract());
}
GetCategoryProductUseCase injectGetCategoryProductUseCase(){
  return GetCategoryProductUseCase(injectHomeRepository());
}
GetBrandProductUseCase injectGetBrandProductUseCase(){
  return GetBrandProductUseCase(injectHomeRepository());
}
AddToWishlistUseCase injectAddToWishlistUseCase(){
  return AddToWishlistUseCase(injectWishlistRepositoryContract());
}
WishlistRepositoryContract injectWishlistRepositoryContract(){
  return WishlistRepositoryImp(injectWishlistRemoteDataSource());
}
WishlistRemoteDataSource injectWishlistRemoteDataSource(){
  return WishlistRemoteDataSourceImp(ApiManager.getInstance());
}
RemoveFromWishlistUseCase injectRemoveFromWishlistUseCase(){
  return RemoveFromWishlistUseCase(injectWishlistRepositoryContract());
}
GetWishlistUseCase injectGetWishlistUseCase(){
  return GetWishlistUseCase(injectWishlistRepositoryContract());
}