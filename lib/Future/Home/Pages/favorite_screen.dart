import 'package:ecommerce_app_qr/Future/Home/Widgets/error_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/favScreen/fav_card_product.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../Cubits/favoriteCubit/favorite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteCubit>().getProductsFavorite();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 10.h),
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Padding(
            // title: BackWidget(
            // canPop: true,
            // hasBackButton: false,
            // hasStyle: true,
            // text: "fav_screen_title".tr(context),
            // iconColor: Colors.white,
            // textColor: AppColors.primaryColors,

            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "fav_screen_title".tr(context),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.primaryColors),
            ),
          ),
        ),
      ),
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetFavoriteProductsSuccessfulState) {
            if (state.fvModel!.isEmpty) {
              return Center(
                child: Text(
                  "fav_body_msg".tr(context),
                ),
              );
            } else {
              return GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.fvModel!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.06.h,
                    crossAxisCount: 2,
                    crossAxisSpacing: 3.w,
                    mainAxisSpacing: 1.h),
                itemBuilder: (context, index) {
                  return FavCardProduct(
                      isHomeScreen: false, product: state.fvModel![index]);
                },
              );
            }
          } else if (state is FavoriteProductsErrorState) {
            return MyErrorWidget(
                msg: state.message,
                onPressed: () {
                  context.read<FavoriteCubit>().getProductsFavorite();
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
