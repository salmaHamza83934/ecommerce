import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/products_tab/cubit/produts_tab_states.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/products_tab/cubit/produts_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class ProductImagesWidget extends StatelessWidget {
  ProductEntity productEntity;

  ProductImagesWidget(this.productEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CarouselSlider.builder(
          itemCount: productEntity.images?.length,
          itemBuilder: (context, index, realIndex) {
            return productEntity.images?[index] == null
                ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.magentaHaze,
                ))
                : Image.network(
              productEntity.images?[index] ?? '',
              fit: BoxFit.cover,
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
          ),
        ),
        BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
          builder: (context, state) {
            final isFavourite = BlocProvider.of<ProductsTabViewModel>(context)
                .favouriteProductIds
                .contains(productEntity.id ?? '');
            return GestureDetector(
              onTap: () {
                BlocProvider.of<ProductsTabViewModel>(context)
                    .addToWishlist(productEntity.id ?? '');
              },
              child: Container(
                margin: EdgeInsets.all(8.r),
                width: 50.w,
                height: 50.h,
                decoration: const ShapeDecoration(
                  shadows: [BoxShadow(color: Colors.black)],
                  color: Colors.white,
                  shape: OvalBorder(),
                ),
                child: Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.magentaDye,
                  size: 35.r,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
