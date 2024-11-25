import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/products_tab/product_list_tab.dart';
import '../tabs/profile_tab/profile_tab.dart';
import '../tabs/wishlist_tab/wishlist_tab.dart';
import 'home_screen_states.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());
static HomeScreenViewModel get(context)=>BlocProvider.of(context);
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    WishlistTab(),
    const ProfileTab()
  ];
  void changeBottomNavigationBar(int newSelectedIndex){
    HomeScreenInitialState();
    selectedIndex=newSelectedIndex;
    emit(ChangeBottomNavigationBar());
  }

}