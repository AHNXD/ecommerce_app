import 'package:ecommerce_app_qr/Future/Home/Cubits/GetCatigoriesOffers/get_catigories_offers_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/cartCubit/cart.bloc.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/error_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/models/catigories_model.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';

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
    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(
        String message, Color color) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Container(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(2.w)),
              margin: EdgeInsets.symmetric(horizontal: 0.1.w),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            duration: const Duration(seconds: 5)),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 11.h),
        child: const AppBarWidget(),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddToCartState) {
            showMessage('add_product_done'.tr(context), Colors.green);
          } else if (state is AlreadyInCartState) {
            showMessage('product_in_cart'.tr(context), Colors.grey);
          }
        },
        child: ListView(
          shrinkWrap: true,
          controller: controller,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "offers".tr(context),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: AppColors.textTitleAppBarColor),
              ),
            ),
            BlocBuilder<GetCatigoriesOffersCubit, GetCatigoriesOffersState>(
              builder: (context, state) {
                final model = context.read<GetCatigoriesOffersCubit>();
                if (state is GetCatigoriesOffersLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetCatigoriesOffersErrorState) {
                  return MyErrorWidget(
                    msg: state.msg,
                    onPressed: () {
                      model.getOffersCatigories();
                    },
                  );
                }
                return CarouselSliderWidget(
                  list: offersList(model.offersCatigoriesModel!.data!),
                  height: 15.h,
                );
              },
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "categoris".tr(context),
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
                "latest_products".tr(context),
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
        } else if (catigoryState is GetCatigoriesErrorState) {
          return MyErrorWidget(
            msg: catigoryState.msg,
            onPressed: () {
              context.read<GetCatigoriesCubit>().getCatigories();
            },
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
