import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/ui/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:ecommerce_app/ui/product_details/product_details_view.dart';
import 'package:ecommerce_app/ui/search_screen/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui/home_layout/cubit/home_screen_view_model.dart';
import '../../ui/home_layout/home_page_layout.dart';
import '../../ui/home_layout/tabs/home_tab/cubit/home_tab_view_model.dart';
import '../../ui/home_layout/tabs/home_tab/products_by_category_screen.dart';
import '../../ui/home_layout/tabs/products_tab/cubit/produts_tab_view_model.dart';
import '../../ui/login_screen/cubit/login_view_model.dart';
import '../../ui/login_screen/login_view.dart';
import '../../ui/signup_screen/cubit/reigister_view_model.dart';
import '../../ui/signup_screen/register_view.dart';
import '../di.dart';
import '../../ui/splash_screen/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginScreenViewModel>(),
            child: const LoginView(),
          ),
        );

      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterScreenViewModel>(),
            child: const RegisterView(),
          ),
        );

      case Routes.homePageLayout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductsTabViewModel>()
                  ..getAllProducts()
                  ..getWishlist(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeTabViewModel>()
                  ..getNewArrivalProducts()
                  ..getAllCategories(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeScreenViewModel>(),
              ),
              BlocProvider(
                create: (context) => getIt<CartTabViewModel>()..getCartItems(),
              ),
            ],
            child: HomePageLayout(),
          ),
        );

      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CartTabViewModel>(),
              ),
              BlocProvider(
                create: (context) => getIt<ProductsTabViewModel>(),
              ),
            ],
            child: ProductDetailsView(args?['products']),
          ),
        );

      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CartTabViewModel>()..getCartItems(),
            child: CartScreen(),
          ),
        );
      case Routes.searchView:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductsTabViewModel>(),
              ),
              BlocProvider(
                create: (context) => getIt<CartTabViewModel>()..getCartItems(),
              ),
            ],
            child: SearchView(),
          ),
        );
      case Routes.productsByCategoryScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductsTabViewModel>(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeTabViewModel>()
                  ..getProductByCategoryId(args?['category_id']),
              ),
              BlocProvider(
                create: (context) => getIt<CartTabViewModel>(),
              )
            ],
            child: ProductsByCategoryScreen(args?['category_id']),
          ),
        );

      default:
        return null;
    }
  }
}
