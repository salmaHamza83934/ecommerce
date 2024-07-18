import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/theme/Colors.dart';
import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/ui/product_details/product_details_view.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_states.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_view_model.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/widgets/product_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatefulWidget {
  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  ProductsTabViewModel viewModel = ProductsTabViewModel(
      addToWishlistUseCase: injectAddToWishlistUseCase(),
      getProductsUseCase: injectGetProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
    removeFromWishlistUseCase: injectRemoveFromWishlistUseCase(),
    getWishlistUseCase: injectGetWishlistUseCase()
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsTabViewModel>(
      create: (context) => viewModel,
      child: BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
        bloc: viewModel..getAllProducts()..getWishlist(),
        builder: (context, state) {
          return state is AllProductsLoadingState || state is GetWishlistLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1 /
                        1.26, // Adjust childAspectRatio to control item height
                  ),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final isFavourite = viewModel.favouriteProductIds.contains(viewModel.products[index].id??'');

                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProductDetailsView.routeName,
                              arguments: viewModel.products[index]);
                        },
                        child: ProductItemWidget(
                          product: viewModel.products[index],
                          addToCart:(){ viewModel
                              .addToCart(viewModel.products[index].id ?? '');},
                          addToWishlist: (){
                            viewModel
                                .addToWishlist(viewModel.products[index].id??'',);
                          }, isFavourite: isFavourite,
                        ));
                  },
                  itemCount: viewModel.products.length,
                );
        },
      ),
    );
  }
}
