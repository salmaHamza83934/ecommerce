import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/get_categories_usecase.dart';
import '../../tabs/favorite_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/product_list_tab.dart';
import '../../tabs/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());

  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  void changeBottomNavigationBar(int newSelectedIndex){
    HomeScreenInitialState();
    selectedIndex=newSelectedIndex;
    emit(ChangeBottomNavigationBar());
  }

}