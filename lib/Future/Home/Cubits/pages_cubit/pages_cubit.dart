// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ecommerce_app_qr/Future/Home/Pages/history_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/favorite_screen.dart';

import 'package:flutter/material.dart';

import '../../../../Utils/enums.dart';
import '../../Pages/cart_screen1.dart';
import '../../Pages/home_screen.dart';

part 'pages_state.dart';

class PagesScreenCubit extends Cubit<PageScreenState> {
  PagesScreenCubit()
      : super((PageScreenInitialState(
            page: HomeScreen(), pageType: AppScreen.home)));

  Widget currentScreen = HomeScreen();
  AppScreen type = AppScreen.home;
  BuildContext? mycontext;
  void changedScreen(AppScreen page, BuildContext context) {
    // mycontext = context;
    emit(PageScreenInitialState(page: currentScreen, pageType: type));
    switch (page) {
      case AppScreen.home:
        currentScreen = HomeScreen();
        type = AppScreen.home;

        break;
      case AppScreen.cart:
        currentScreen = const CartScreen1();
        type = AppScreen.cart;

        break;
      case AppScreen.history:
        currentScreen = HistoryScreen();
        type = AppScreen.history;

        break;

      case AppScreen.favorite:
        currentScreen = const FavoriteScreen();
        type = AppScreen.favorite;

        break;
    }

    emit(PagesScreenChange(page: currentScreen, pageType: type));
  }

  void initContext(BuildContext context) {
    mycontext = context;

    emit(PageScreenInitState());
  }
}
