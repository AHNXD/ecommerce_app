import 'package:ecommerce_app_qr/Future/Home/models/catigories_model.dart';
import 'package:ecommerce_app_qr/Utils/SharedPreferences/SharedPreferencesHelper.dart';

import '/Future/Home/Cubits/getProducts/get_products_cubit.dart';
import '../Cubits/getCatigories/get_catigories_cubit.dart';
import '/Future/Home/Widgets/home_screen/appbar_widget.dart';
import '/Future/Home/Widgets/home_screen/carousel_slider_widget.dart';
import '../Widgets/home_screen/home_page_categories_button_widget.dart';
import '/Future/Home/Widgets/home_screen/tilte_card_widget.dart';
import '/Future/Home/models/product_model.dart';
import '/Utils/colors.dart';
import '/Utils/test_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 11.h),
        child: const AppBarWidget(),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        shrinkWrap: true,
        controller: controller,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     AppSharedPreferences.getLang == "en" ? "Offers" : "العروض",
          //     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: AppColors.textTitleAppBarColor),
          //   ),
          // ),
          // BlocBuilder<GetCatigoriesOffersCubit, GetCatigoriesOffersState>(
          //   builder: (context, state) {
          //     final model = context.read<GetCatigoriesOffersCubit>();
          //     if (state is GetCatigoriesOffersLoadingState) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else if (state is GetCatigoriesOffersErrorState) {
          //       return MyErrorWidget(
          //         msg: state.msg,
          //         onPressed: () {
          //           model.getOffersCatigories();
          //         },
          //       );
          //     }
          //     return CarouselSliderWidget(
          //       list: offersList(model.offersCatigoriesModel!.data!),
          //       height: 15.h,
          //     );
          //   },
          // ),
          SizedBox(height: 1.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppSharedPreferences.getLang == "en" ? "Categories" : "الأصناف",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: AppColors.textTitleAppBarColor),
            ),
          ),
          SizedBox(
            height: 8.h,
            child: const HomePageCategoriesButtonWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppSharedPreferences.getLang == "en"
                  ? "Latest Products"
                  : "اخر المنتجات",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: AppColors.textTitleAppBarColor),
            ),
          ),
          LastestProductAndTitle(controller: controller),
          SizedBox(
            height: 2.h,
          )
        ],
      ),
    );
  }
}

class LastestProductAndTitle extends StatelessWidget {
  const LastestProductAndTitle({
    super.key,
    required this.controller,
  });
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCatigoriesCubit, GetCatigoriesState>(
      builder: (context, catigoryState) {
        if (catigoryState is GetCatigoriesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, productState) {
            if (productState is GetProductsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                controller: controller,
                itemCount: context
                    .read<GetCatigoriesCubit>()
                    .catigoriesModel!
                    .data!
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  String name = context
                      .read<GetCatigoriesCubit>()
                      .catigoriesModel!
                      .data![index]
                      .name!;
                  int id = context
                      .read<GetCatigoriesCubit>()
                      .catigoriesModel!
                      .data![index]
                      .id!;
                  CatigoriesData cData = context
                      .read<GetCatigoriesCubit>()
                      .catigoriesModel!
                      .data![index];
                  int len =
                      context.read<GetProductsCubit>().model!.data!.length;
                  List<MainProduct> l = <MainProduct>[];
                  for (int i = 0; i < len; i++) {
                    MainProduct m =
                        context.read<GetProductsCubit>().model!.data![i];
                    if (m.categoryId ==
                        context
                            .read<GetCatigoriesCubit>()
                            .catigoriesModel!
                            .data![index]
                            .id) {
                      l.add(m);
                    }
                  }

                  return Column(
                    children: [
                      TitleCardWidget(title: name, id: id, cData: cData),
                      CarouselSliderWidget(
                        list: productCardList(true, l),
                        height: 45.h,
                      ),
                    ],
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
