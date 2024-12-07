import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/ui/search_screen/search_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_text_styles.dart';
import '../home_layout/tabs/products_tab/cubit/produts_tab_view_model.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.delftBlue,
                      size: 40.r,
                    )),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.clear();
                            },
                            icon: const Icon(Icons.close)),
                        hintText: 'Search here',
                        hintStyle: AppTextStyles.font18MagentaHaze
                            .copyWith(color: Colors.grey.shade500),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                                color: AppColors.delftBlue, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                                color: AppColors.delftBlue, width: 2))),
                    controller: controller,
                    onFieldSubmitted: (value) {
                      BlocProvider.of<ProductsTabViewModel>(context)
                          .getAllProducts(query: value);
                    },
                  ),
                ),
              ],
            ),
            SearchResultWidget(controller)
          ],
        ),
      ),
    );
  }
}
