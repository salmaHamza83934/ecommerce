import 'package:ecommerce_app/ui/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home_screen';
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: buildCustomNavigationBar(
              context: context,
              selectedIndex: viewModel.selectedIndex,
              onTapFunction: (index) {
                viewModel.changeBottomNavigationBar(index);
              },
            ),
            body: viewModel.tabs[viewModel.selectedIndex],
          );
        },
        listener: (context, state) {});
  }
}
