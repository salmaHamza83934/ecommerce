import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_states.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_view_model.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListTab extends StatefulWidget {
  const ProductListTab({super.key});

  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
      builder: (context, state) {
        return state is AllProductsLoadingState
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.delftBlue,
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
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.productDetailsScreen, arguments: {
                          'products': BlocProvider.of<ProductsTabViewModel>(context).products[index]
                        });
                      },
                      child: ProductItemWidget(
                        product: BlocProvider.of<ProductsTabViewModel>(context).products[index],
                      ));
                },
                itemCount: BlocProvider.of<ProductsTabViewModel>(context).products.length,
              );
      },
    );
  }
}
