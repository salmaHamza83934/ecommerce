import 'package:ecommerce_app/data/api/api_manager.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/get_categories_usecase.dart';
import '../../tabs/wishlist_tab/wishlist_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/products_tab/cubit/produts_tab_states.dart';
import '../../tabs/products_tab/product_list_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());
static HomeScreenViewModel get(context)=>BlocProvider.of(context);
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    WishlistTab(),
    ProfileTab()
  ];
  void changeBottomNavigationBar(int newSelectedIndex){
    HomeScreenInitialState();
    selectedIndex=newSelectedIndex;
    emit(ChangeBottomNavigationBar());
  }

}