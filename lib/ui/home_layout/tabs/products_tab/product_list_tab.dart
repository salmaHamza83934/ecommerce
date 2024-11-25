import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/products_tab/widgets/product_item_shimmer.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/products_tab/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/produts_tab_states.dart';
import 'cubit/produts_tab_view_model.dart';

class ProductListTab extends StatelessWidget {
  const ProductListTab({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
      builder: (context, state) {
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1 / 1.26,
          ),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return state is AllProductsLoadingState
                ? const ProductItemShimmer()
                : GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.productDetailsScreen,
                  arguments: {
                    'products': BlocProvider.of<ProductsTabViewModel>(context).products[index]
                  },
                );
              },
              child: ProductItemWidget(
                product: BlocProvider.of<ProductsTabViewModel>(context).products[index],
              ),
            );
          },
          itemCount: state is AllProductsLoadingState
              ? 8
              : BlocProvider.of<ProductsTabViewModel>(context).products.length,
        );
      },
    );
  }
}
