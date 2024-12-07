import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/routing/routes_names.dart';
import '../../products_tab/widgets/product_item_shimmer.dart';
import '../../products_tab/widgets/product_item_widget.dart';
import '../cubit/home_tab_view_model.dart';

class NewArrivalProductsSection extends StatelessWidget {
  bool isLoading;


  NewArrivalProductsSection(this.isLoading, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1 /
            1.26, // Adjust childAspectRatio to control item height
      ),
      itemBuilder: (context, index) {
        return isLoading?const ProductItemShimmer():GestureDetector(
            onTap: () {
              Navigator.pushNamed(context,
                  Routes.productDetailsScreen, arguments: {
                    'products':
                    BlocProvider.of<HomeTabViewModel>(context)
                        .newArrivalProducts[index]
                  });
            },
            child: ProductItemWidget(
              product:
              BlocProvider.of<HomeTabViewModel>(context)
                  .newArrivalProducts[index],
            ));
      },
      itemCount:isLoading?8:BlocProvider.of<HomeTabViewModel>(context)
          .newArrivalProducts
          .length,
    );
  }
}
