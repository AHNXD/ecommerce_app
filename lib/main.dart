import 'package:ecommerce_app_qr/Future/Home/Cubits/favoriteCubit/favorite_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/getCatigories/get_catigories_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/getProducts/get_products_cubit.dart';
import '/Apis/Network.dart';
import '/Future/Auth/cubit/auth_cubit.dart';
import '/Future/Home/Pages/navbar_screen.dart';
import 'Future/Home/Cubits/CompairPruductsCubit/compair_products_cubit.dart';
import 'Future/Home/Cubits/GetCatigoriesOffers/get_catigories_offers_cubit.dart';
import 'Future/Home/Cubits/cartCubit/cart.bloc.dart';
import 'Future/Home/Cubits/postOrders/post_orders_cubit.dart';
import 'Future/Home/Cubits/rangeSliderCubit/range_slider_cubit.dart';
import '/Utils/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'Future/Home/Cubits/pages_cubit/pages_cubit.dart';
import 'Future/Home/Cubits/searchProductsCubit/search_products_cubit.dart';
import 'Utils/enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();
  await Network.init();
  AppSharedPreferences.saveToken(
      "81|SCfJ2b1Mc8GlNjlzVRIrxslefGOuDGRnMEX0vwKl6b57a960");
  debugPrint("token is ${AppSharedPreferences.getToken}");
  debugPrint("lang  is : ${AppSharedPreferences.getLang}");

  runApp(const MyApp());
}

final scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => GetCatigoriesOffersCubit()..getOffersCatigories()),
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider(create: (_) => GetCatigoriesCubit()..getCatigories()),
          BlocProvider(create: (_) => GetProductsCubit()..getProducts()),
          BlocProvider(
              create: (_) => FavoriteCubit()..getProductsFavorite(false)),
          BlocProvider(create: (_) => RangeSliderCubit()),
          BlocProvider(create: (_) => CartCubit()),
          BlocProvider(create: (_) => CompairProductsCubit()),
          BlocProvider(create: (_) => SearchProductsCubit()),
          BlocProvider(create: (_) => PostOrdersCubit()),
          BlocProvider(
              create: (_) =>
                  PagesScreenCubit()..changedScreen(AppScreen.home, context)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
          ),
          home:
              //  ProductScreen(clickIndex: 2,)
              const NavBarPage(),
        ),
      ),
    );
  }
}
