import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/Colors.dart';

class ProductImagesWidget extends StatelessWidget {
  ProductEntity productEntity;
  ProductImagesWidget(this.productEntity);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Image.network(
            productEntity.images![0],
            fit: BoxFit.cover,
            width: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 50.w,
                ),
              );
            },
          ),
          Image.network(
            productEntity.images![1],
            fit: BoxFit.cover,
            width: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 50.w,
                ),
              );
            },
          ),
          Image.network(
            productEntity.images![2],
            fit: BoxFit.cover,
            width: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 50.w,
                ),
              );
            },
          ),
        ],
        options: CarouselOptions(
          height: 300.h,
          autoPlay: true,
          viewportFraction: 1,
          initialPage: 0,
        ));

  }
}
